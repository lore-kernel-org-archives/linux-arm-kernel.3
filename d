Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9383CCE8E64
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 11:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=CAgubeWyle1FOq
	VpfzSH3Rqb0/fSTpXj0UWSmPHU1VyNU+DkmzlLnq6gGoNc32gH/vh+pPqS9pRhP7MOJiRtxw3JxAj
	Ay+4hsNpsnzDUP0USkT6VkxCnnGU6eT+VA5PRcQ1GqUsZwB2W42UaY255/z3doxc0ZCrI2BklwjDy
	VknUv3bTp8rp+wX9m+oA5l0/kC6xahy3NBjr9UgHm4LrIY3q53fGmFnu7W6urqonuMMXiVbO7b39H
	rdIT/5gTzUFDAQK+SViAqM9FqiYQ1dexuZkGvnWJbyb1qDkbem3iqcr5fSYWZXe3anh+V340lfaKl
	epIUCjoirS2SW6HjcZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3w2l-00000000DEI-1pPB;
	Thu, 24 Oct 2024 11:30:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vqR-00000000Bln-3LPG
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Oct 2024 11:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Content-Transfer-Encoding:
	Content-ID:Content-Description:References;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=; b=LvxNd3/RhJwHOc8T04MXW+j+Fg
	Zt4HithGE0+TbfPnyUHQmlSHTSBa+BeWNgw10KrrLhvQMp5VJt8UbxKSwj7A7/bguB0dGD7nc6tYK
	Osc2MLP+g4hHPjcHqovmMV8FjZkyDdmpOZSEn7iuZyXpQlBx3tqoPT4T5+jB3PD0hHloEOoDvcKoP
	9GSEJtC2fAlkkDkGyiSzQDN3iPTDem+PBcCJLEYVsUOIbE7IhHE4FP/Nc5zWIawlC6ckIBTBEFa3w
	cKx/XXOaRTNIfYHC8BIzitA51mRNsGmXuzUBflrpAV8BzNS+l953pd9GAOsFZan0unnzkPXhtNbKM
	zTiLh0EQ==;
Received: from mail.loongson.cn ([114.242.206.163])
	by desiato.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3vqN-00000008eOd-0iD2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 11:17:34 +0000
Received: from loongson.cn (unknown [10.20.42.10])
	by gateway (Coremail) with SMTP id _____8BxYa_BLBpng5oKAA--.24466S3;
	Thu, 24 Oct 2024 19:17:21 +0800 (CST)
Received: from localhost (unknown [10.20.42.10])
	by front1 (Coremail) with SMTP id qMiowMAxbODALBpnS2UPAA--.19609S2;
	Thu, 24 Oct 2024 19:17:21 +0800 (CST)
Date: Thu, 24 Oct 2024 19:17:44 +0800
From: Wanglei <wanglei@loongson.cn>
To: mike@altlinux.ru
Cc: aospan@netup.ru, conor.dooley@microchip.com, ddrokosov@sberdevices.ru,
	dmaengine@vger.kernel.org, dushistov@mail.ru,
	fancer.lancer@gmail.com, geert@linux-m68k.org,
	gregkh@linuxfoundation.org, hoan@os.amperecomputing.com,
	ink@jurassic.park.msu.ru, jeffbai@aosc.io, kexybiscuit@aosc.io,
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org,
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru,
	ntb@lists.linux.dev, patches@lists.linux.dev,
	richard.henderson@linaro.org, s.shtylyov@omp.ru, serjk@netup.ru,
	shc_work@mail.ru, torvalds@linux-foundation.org,
	torvic9@mailbox.org, tsbogend@alpha.franken.de,
	v.georgiev@metrotek.ru, wangyuli@uniontech.com,
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Subject: Re: what about CoC? (was: [PATCH] Revert "MAINTAINERS: Remove some
 entries due to various compliance requirements.")
Message-ID: <20241024111744.GA22673@loongson-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241024095339.GA32487@imap.altlinux.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: qMiowMAxbODALBpnS2UPAA--.19609S2
X-CM-SenderInfo: pzdqwzthl6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7
	ZEXasCq-sGcSsGvfJ3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29K
	BjDU0xBIdaVrnRJUUUBCb4IE77IF4wAFF20E14v26r1j6r4UM7CY07I20VC2zVCF04k26c
	xKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1Y6r17M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vE
	j48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxV
	AFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7Cj
	xVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487M2AExVAIFx02aVAFz4v204
	v7Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IY
	x2IY67AKxVWUtVWrXwAv7VC2z280aVAFwI0_Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4
	x0Y48IcVAKI48JM4kE6I8I3I0E14AKx2xKxVC2ax8xMxAIw28IcxkI7VAKI48JMxC20s02
	6xCaFVCjc4AY6r1j6r4UMxCIbckI1I0E14v26r4a6rW5MI8I3I0E5I8CrVAFwI0_Jr0_Jr
	4lx2IqxVCjr7xvwVAFwI0_Jr0_Jr4lx4CE17CEb7AF67AKxVWrXVW8Jr1lIxkGc2Ij64vI
	r41lIxAIcVC0I7IYx2IY67AKxVW5JVW7JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr
	1UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVW8JVWxJwCI42IY
	6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUcCD7UUUUU
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_121731_895705_CBB97B6C 
X-CRM114-Status: UNSURE (   2.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Reply-To: Wanglei <wanglei@loongson.cn>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



