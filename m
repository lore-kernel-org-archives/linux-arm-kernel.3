Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3006DC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 07:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lZ6ilgd+d6KfG9lOxFSFTm3CnNKt2h2pPE7ocZRUsd4=; b=fcPY6DXsa6curucYTbn07jWoLr
	uZx+diK7m2IAecqr7ZDymizQfjXWO9rLGHAS+hL8l+1RShFj7GXyyEuZmEg+HpHqNLbRv9HvyRcEX
	FjpjXDyEwn7MrbHc8sYMo9SYpAwTTSnRF07WeubHdhQYtMc6PK9J8ruYGM7MpL357O9pbU1muTx0B
	f4vjC2NM7y838dC1A+q9iEmYrRcGstVOCaKYjUGDXTepe9GrySFFgoFzi5WkwzCV4oUKapBErLwsE
	pJLS4Kx0LJ5+BBEcgDdPOPdoZ6kPGmomJDzS5i//2mY5FbCr374bSySTEzZXlYBuEmLoiKz9Uli8G
	r3FglbVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWFa-00000002DN7-2NSG;
	Tue, 01 Apr 2025 07:41:34 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzWCX-00000002D2f-0B7Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 07:38:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1743493072; x=1744097872; i=markus.elfring@web.de;
	bh=lZ6ilgd+d6KfG9lOxFSFTm3CnNKt2h2pPE7ocZRUsd4=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=TRURDuB8XuAeNfRoBqN8GowqN/SD2xhR3YnrweZTGFOPOpQBfPb4s1bNtHI6pkN5
	 rAzjJOynuBfZpUC00AOPLQld2fYvvRUvwYZydXB4KYIh18NGriYVsREfLAIXOPMW2
	 NuQdNCzsHEedxS5Kfx/FsgN0mtKKIFuvib2UjYDBfowDxBD4OHGHoB2Gb4qohQA+C
	 P8z1lPc4GkTWxWkWxP+Q9JDaUPBnr+GYfOtbABZVCQu0Hun74SH5q0+OPKuZy+Ur6
	 yMa4rSd33NnJltam/MZLNmgevgI9RNn+T947G7wSgZI8GVSjafjyqCtB1zE7kSLyb
	 l3qi1mSqjkO7OKzcgw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.54]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N1uAv-1sxQ5p2UZ7-016DUR; Tue, 01
 Apr 2025 09:37:52 +0200
Message-ID: <0325e399-42e9-4744-837a-fcc7fb3f6787@web.de>
Date: Tue, 1 Apr 2025 09:37:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-aspeed@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Cc: LKML <linux-kernel@vger.kernel.org>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Arnd Bergmann <arnd@arndb.de>,
 Bjorn Andersson <andersson@kernel.org>,
 Herve Codina <herve.codina@bootlin.com>, Joel Stanley <joel@jms.id.au>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
References: <20250401033935.17617-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v4?] drivers/misc: Add NULL check in
 aspeed_lpc_enable_snoop
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250401033935.17617-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:uBUtwrdW9UP/4MafolPA1rdm/y65edT5dtJ5kT+ZActg0X4du07
 IxCOyZmo6MSLsdXF379CVK7lNSjb5eXLgInBPlvgRTHSeXQ6U1GOnb47T7zdYzTWRdY0JqI
 gOi8MkOzsYvHetZtp4r1F1fTtasV8NobFFY8vSkIDlzhEIFWPWn1Q6XUwxVYygmziDJNHGN
 OdBdXJQrr6VurIKS3s5JA==
UI-OutboundReport: notjunk:1;M01:P0:0osCmIXyPyc=;c7+bBTwZNL5IQLeFLOuZMLvDygW
 EQg8bchrYLNMqmczPwg6eBhHE3KcMEobAkDC4yb51d6m/cFlqLC7RLudl9JuQb98f8A+Jf+tj
 rmP14N2XGC0pvXVxZxUL5m5bwQ2jnjNr83dSl9ga3/wk8phKDpDIs1KxkZvpLf4VeG3Qfg/ZB
 OQlhhguO4lDGNpznkrUzrL0nqfPUYXDfY4Q/zViS075S23ygWXBfz+eozbkyx0/ScVr8Vljyz
 npCWu2r6mf57ydJH9ni1gSou16EMhAOW/pquIsx47/x/vbuAjNBdqZekOKHBA7UYXNEaAyis1
 UT8ZInSkA5/kK7qKkuhdjjnq2QaNgELfirBeh7M5EItKt4UDWTmuxvxmU1ttPMe98l1DO0gW2
 sQnUE3ZbODLD4aqjYVRMPEQykXX95wgzCGqnmcgf2tS+T2eK0zSXDizFWsNbXq3PvNrxQRDoR
 dGac0Db8Uco/Cw+7sh6Ld8WYgPJY1LOvTuk9tAu3LEvkozcmOQA0yVWJEtHH+3srKAPyLKfAq
 xcNGslzzS4+Pj1yLX6DFefqct9UpsyLS+RQ4lPaBuW295cirN4ZyUhP4cfh0zE7wNL0yCGshR
 3DplK+W+D8IobWxvgieeB0KjMIk9eZDtPvCl4JfwqWAsifEjItAJXYHke5sZSRqf3obl+OK6q
 r4dSk72hAEoFahV4KpHgfkVVOBelS8vQJ9duiM/gG+jyDFGxZOSlnkEtkvy38J7yLZ7EjnS4s
 YLi6ons5cfQVCby1mgA+CXsy5Pt5lmmHRsmkzT/UPwDFh/CiNKU3gMQ4AuR2TBcTdXa+a4MwT
 F3lUR3bpQQR/Z1InzJ8UA2+wkUikbAQAYP88b2PmKrI8DY2rkfBzRqg5tbpZdYVzBf8RUaGoY
 wSoTS1Id31IF0UitT8x+8Mcen/mwniXSJWolm5urot0PxlrDo39LiNmRCfe63iERncJMq5zdt
 U3fPpXyxvkSXBYYrO0XE6PTLzPsE56OwBcLJiNkJwxEs7+XKHewVSfoqyrtW5GIJ/ozssVOuU
 YS3FpllobxkxsMIZiopxeQZTFMcirYMFT73cIlOpcEb4lO3OLY36eqHAQrzEMW13N1Gen0N4C
 mXZGqbpJ3lBOw13HenFMC574TkZZ5WhHCubL0fpcj7khJx4V5aOpEwrGeCnFwZJazFXtpZlGz
 yT++Sp6MuBebKowRmWZeFhcSg/ZmPQjKy8cxm8X5cVnKWc4E5y5RiJrqr1VQyyrAHO6BbsoVD
 KJa2+4oyDbMCLQuhFN9IFuz/FFQD6q+InoQoH5QaZpDYm6z1Q+vauZ4xp3BQ3p4ckhxEQWcFV
 b7OTCUrIDkQ+85AuKDcycDdjKXLDVQYQxFegCuLZT/9yF5NZUGWKPi2hTa4wvc2vo+HzNEs3k
 btB2aANdFvDZRKTKlQuWs+ESv4kOnYN+/uuFtE+YTkS6ASQq8X8Cp+pdc++ExcqDMzGJbKbxA
 /gfhQSrl7TNE5jEona35SDluZ+Wl0F91H+uY8mfFtuex3xWv2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_003825_384976_BFEAC57B 
X-CRM114-Status: UNSURE (   4.93  )
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

=E2=80=A6
> ---
> V2 -> V3: Simplify =E2=80=A6

Is there a need to reconsider patch version numbers a bit more?

Regards,
Markus

