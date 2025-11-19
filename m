Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF03DCF3943
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 15:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=q7oXsCw8dCi+swPt6E0LzCpWKL/bobFScOJrhbhvFA8=; b=tTwo5z0t2qWFWwZ4emECewTysc
	C/AspFuxB9Bsv1Saad/+z4X9v2Olpjf3+6Rt+WpGs1ONQIYewE0RNf2CORujfEaYD7N/fXFUllesC
	iTej/YmhEmI8L8oMGbvgoSqlgNw/6S9ZuRY5/bPjNUxsHSsWWzU0HzeqwtvFDCvVX3eISJDVfgMVs
	0qg/OTByofw6ZB8AmHk9TkhRMDSzBS6EjpmegkdvVI0g77e/pv103Y3yVAxxGPt2UrBbkmLEiN+np
	FZflsTFkJj8DnQ0LZr5C5G9zJOo9rLoVuOoaDrTjEb/F+O5xiSEbFYUJaN6ew2gXTqNtBK1ofPIzh
	c/RhU6ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkUJ-00000003b8i-0suM;
	Wed, 19 Nov 2025 15:52:55 +0000
Received: from mout.web.de ([212.227.15.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLkUF-00000003b71-40Ll;
	Wed, 19 Nov 2025 15:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1763567554; x=1764172354; i=markus.elfring@web.de;
	bh=q7oXsCw8dCi+swPt6E0LzCpWKL/bobFScOJrhbhvFA8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=fpqjargt3AqVFOxku/vjwB176M8q+/z1YlH1tuoASCGyXpafizmQphh95JSwVXXn
	 QxS7segROkpR6gT+1P2tEKNXLYl6oknm2tF7FYkISikqQlkMBj+vdu/R63Nt4hcj4
	 CQ4NqmADx8SnqlhIKHFHLhQnWLRtyr8uj58+HJBZ+Hm3i8eHOySX/aYYwhMzRkU7U
	 PmixSV4uoObDsg8vE5JRHA7MIoj8dOICrjUVctkJ1p9xyscFd3fWb46qVR9rGtq99
	 QvzO/ScGvS9up18vs+p/lCvnKkCEGSs37VHxQZYCWzzHh82cQy9dz4e+dzwyhmKiw
	 EH/T8AYNEPrFSncwOw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.228]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MzkOL-1w7gCx267N-012vrO; Wed, 19
 Nov 2025 16:52:34 +0100
Message-ID: <84ddee3b-df7b-4022-a864-66da95283394@web.de>
Date: Wed, 19 Nov 2025 16:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Lee Jones
 <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Content-Language: en-GB, de-DE
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: [RFC] mfd: mt6358: Using a single IRQ array instead of two companion
 arrays?
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:4rooN7CcuZnezzK4uccyZfNqYe2COM18ZegiNbcS8YAgWOEs4L4
 5ROv0HOFUIAHPrf9WHqF9zylRC4uCzojPVxZI+CzYqhJF2pVt2zb9ClwddCexP9u/OCocXJ
 0bbhViVDVKM7s2IW3I8bSdMgxlpntKv/XC4pOVJCNMl8c966qPHp2gUdInGKeX3MUQXsZvn
 Z7lXoZayU+b2wCZ/x1JLA==
UI-OutboundReport: notjunk:1;M01:P0:VYLheB8J8S8=;+5zXVNVbZMqbwywBFaahMfdu2P4 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 yER8npvD1I91bODEk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_075252_358461_C5BB5D83 
X-CRM114-Status: UNSURE (   5.00  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hello,

I have taken another look also at the implementation of the function =E2=
=80=9Cmt6358_irq_init=E2=80=9D.
https://elixir.bootlin.com/linux/v6.18-rc6/source/drivers/mfd/mt6358-irq.c=
#L227-L293

I see that there are two arrays allocated so far.
How do you think about the possibility to use a single array with the need=
ed data instead?

Regards,
Markus

