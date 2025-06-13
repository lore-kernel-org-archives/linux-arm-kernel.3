Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 907BAC61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Jun 2025 05:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j9lhSwodmqSZLtijyE0pSLrkjXtCG6UQNDWeeUmgbW8=; b=zZR+tUgXLWXVs1dhS5Zm70Bd9L
	DoePxjp06jk6cnjfTYuYqNOos75UNxz2lZr2iIqwsSfw4s0g9ojVZUr5XHnBGpRjTV6uxW9duOamM
	AxSO4sd4PGsxQK3RVeW9ykLANiXI1Q/OYXiqhGK89shWMAXBLNEDU4++/QM+3lrr4qpAND+nymSit
	Lz4hV1Q25yK2uT3pqVy/5xNYI1VCjJdnPksuTaW6HhDe1rLUWXVbQUT5slC0qEUOPJi88nHuif5WG
	zRXDW0pTD8lINuFBC7zSk3ShnAntJqun7FSCu8H8xNVuJ0Wsh2O22+t6Ipwe/FM72+MgoOhheRwgy
	B7R3O6gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwuA-0000000FNAt-3mCD;
	Fri, 13 Jun 2025 05:24:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwpk-0000000FMVI-3HVI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Jun 2025 05:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=j9lhSwodmqSZLtijyE0pSLrkjXtCG6UQNDWeeUmgbW8=; b=F6gHrXKEfqFjCZGmrcx/nRPUCk
	T2PL8RikBYS5uiakEdcGXa+wz8vxww5KMzZKz/jRw+5lBiIWtTdsDklf3A6q/OuKjQRN4HeyNVa2L
	tWw4sh8JVB0sl1vqyqevpY8lqL6FcpoBAFDWVi2tXKgjNTRPkMwZkiD1SjVjJ7xT6wROgU4I8jc+x
	OJE1EGyBy4lFy0Ayd589ow7BqKEtqKwFR4XY6zqAKzT7Ee70C3jsu/+QmClS4NorbPCuVWohTiYZp
	3TjBtkwiG6acOgZeytf0185oHMlUsK040g77uS7lLxh9vDeBVKkoWxgMoomxljSqcy21pLTOSUGQv
	02CCuxeg==;
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPwph-00000002qsp-34k1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Jun 2025 05:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1749791992;
	bh=j9lhSwodmqSZLtijyE0pSLrkjXtCG6UQNDWeeUmgbW8=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=QvuINQWnEYPzu6AiW//WC2jHdsSgWYaKlBuTLW6kwJTlFGj6iAGW8/qDn+talgmly
	 dkG5UehVSGzVgQZQbo5S0KuKFAPzBUsjt86qXJhkf1AHwPV5MPe9FXztTuQ0By/dRF
	 NlCWml1pUnYk+rXEuiYyg6or2JzFHmKKRNi3yzYcyf9DWCgMJkGZW2tnubQ6DEAXAt
	 iqXZQPeIi/euzBI7GXW7W/HbtudZoiWOrURkZSi2XnYvH3a9qt7mFALREivlMaQSkx
	 O1hOL74z78zGYghiRHkm3jlsWEBNypNMZT+Ioxxig9DZphR+NnWX+z/8Ly/F8ubc5r
	 dEuftikvGR4hQ==
Received: from [127.0.1.1] (unknown [180.150.112.166])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 5763A680F3;
	Fri, 13 Jun 2025 13:19:51 +0800 (AWST)
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 Peter Yin <peteryin.openbmc@gmail.com>
In-Reply-To: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
References: <20250611080514.3123335-1-peteryin.openbmc@gmail.com>
Subject: Re: [PATCH v2 0/5] Revise Meta(Facebook) Harma BMC(AST2600)
Message-Id: <174979199120.342730.12220286428468673903.b4-ty@codeconstruct.com.au>
Date: Fri, 13 Jun 2025 14:49:51 +0930
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_062006_428541_80FAFAFC 
X-CRM114-Status: UNSURE (   6.66  )
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

On Wed, 11 Jun 2025 16:05:09 +0800, Peter Yin wrote:
> Summary:
> Revise linux device tree entry related to Meta(Facebook) Harma
> specific devices connected to BMC(AST2600) SoC.
> 
> Based on:
> https://github.com/torvalds/linux/blob/master/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-harma.dts
> commit-id: cb3f397b17bbda3f2998eff9e54b040c8fa85cc9
> 
> [...]

Thanks, I've applied this to be picked up through the BMC tree.

-- 
Andrew Jeffery <andrew@codeconstruct.com.au>


