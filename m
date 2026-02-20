Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A86F3C5AD57
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 18:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44XHMM4HiGXVuuiMEAL+Zgb1brCATCabA15+Bi10vBM=; b=eXLyeoAyAHWiuxT3vEplQtu7rr
	h+p6sg2Qh/IzN/ILH9/CVOe1Y/ZtfrDkIWPv1zJO5hLm/LJqUdv7VugVJcHh5D4suytFCxakV1PmO
	ZE0CgljSi2sgaBELUd1OpztvOoamdTCnQsR4ffVWXTwVHTPcs9PCar054ITLkK89c1RMDBvMc7LMj
	DV1WRL3A240B8avpKEOU9whImsIgQEa1zv0Ze0qJjrR6Y2/3Ex49n+ODdtu7z8jE9ZRcg0KVXVE9/
	YLI1o721t/Y9FYCCVc22ShBPLBz0LLko9zHtMiyGpy08wNDGcTA8rOUwl7pXJ65bmOuZRUFwUlR7F
	aW9Vrung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVOp-0000000FSYe-3TTK;
	Fri, 20 Feb 2026 18:38:47 +0000
Received: from mout.perfora.net ([74.208.4.194])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtVOm-0000000FSXs-08d0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 18:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziswiler.com;
	s=s1-ionos; t=1771612693; x=1772217493; i=marcel@ziswiler.com;
	bh=44XHMM4HiGXVuuiMEAL+Zgb1brCATCabA15+Bi10vBM=;
	h=X-UI-Sender-Class:Message-ID:Subject:From:To:Cc:Date:In-Reply-To:
	 References:Content-Type:Content-Transfer-Encoding:MIME-Version:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=DAnaaMy6FMfhZ2PwdSqRhG6MDuqyQSedE3vAoFZG2GKJyuf7AQZdNa+TVtKceOxx
	 GLmKB7Tv5VuGCHD28ItratLbK71EFbbQm+dmXH9N620NvrwUDe5RAjTEtLUUiCXwz
	 O7dIHZi+slXQOabDs5OuDN3gYk0al+6SEf5PnAqBnU6oa9NcHfjk/TI/TNS9K0uiH
	 M6ACFR42VCrBf8H33PT/Fer/XdQIuBWF639rVTsW3LVEzzMhfowmPvK9byB+AQQdu
	 I+8q0G2BRF/oHFxumh/eJvAPAN+HrO0qHE9bxJS+2uaDeEG7mTqVpWHZwYPyHe8RV
	 Dq4iINyHX16t7NT5hg==
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from [10.118.255.253] ([213.55.199.191]) by mrelay.perfora.net
 (mreueus002 [74.208.5.2]) with ESMTPSA (Nemesis) id 0Lz5KI-1vgDll0QdM-00szjr;
 Fri, 20 Feb 2026 19:38:13 +0100
Message-ID: <5f99968ec561631852bfa72aea95a100dcad5324.camel@ziswiler.com>
Subject: Re: [PATCH v2 0/2] net: stmmac: eic7700: fix EIC7700 eth1 RX
 sampling timing
From: Marcel Ziswiler <marcel@ziswiler.com>
To: lizhi2@eswincomputing.com, devicetree@vger.kernel.org, 
	andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 netdev@vger.kernel.org, 	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, 	rmk+kernel@armlinux.org.uk,
 linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, 
	pinkesh.vaghela@einfochips.com, weishangjuan@eswincomputing.com, 
	dongxuyang@eswincomputing.com
Date: Fri, 20 Feb 2026 19:37:57 +0100
In-Reply-To: <20260209094628.886-1-lizhi2@eswincomputing.com>
References: <20260209094628.886-1-lizhi2@eswincomputing.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (by Flathub.org) 
MIME-Version: 1.0
X-Provags-ID: V03:K1:u/DHXNq2KmbH+PEHVvmwb1sDGASiAHHbzFo0qypFQSmu/f9iPyH
 wIM60ITAsgVE8zKq8x4W1mwI7OIQOsFfVkvxZRDQ/IfplOt1qrRxMT6waj53uIDR6B0mFaH
 Z4w1OMjNf7s8ziypBjWDeR6Yd9ZHavHCf74toT1z82gG9kf+RbwYNYWNhEkfY8pDrtHDG2H
 m4hi7rLnCghPmV2u0uXDA==
UI-OutboundReport: notjunk:1;M01:P0:N6VQHXQ2V8M=;i1WrHzikZoZ7F0hufQ6NBs+Gb5n
 oH6rserJeM//8krLCVRcJ/pddwD2cVa9puBHNwbNwuk4xlNPEHditbXxpT5GM0acxINOndcsR
 Rf+3DD8vdBcbn9DKYRYHzC06qZz+Wjwd30xVa2pn/yiBDNguVvhc5BJsURC4Vv/JRiZ0d+dt6
 wca8DNjfhUVWJf5/NbgsV115cWGBw4BmtLLvnzUXRXPz7ie2FDOHlfoh0yl3NPRGlNF7TzW9L
 ijaNRUkrSyAfIWFJxnCSYZ1BR6/iYnnSruZ0qG5BK/tSji6vL5RRQaXsNnkt3KWK84hjINfSX
 lCrTQr/ozD82tIXG1zYO4/zmF6AeMn2YP+2Mg6WlLemR57XQrTUVrO9Xtg+gyG0V0XhKH6TqW
 1rJuye+jU5eT8DIxCBiTircrRrk3csG6f74zK+ZOBLxHqYcS2+lMncGgfnRtHPN5TVp+1keV6
 HzFiNxvUHpQfDCZRgm3T2bo8UxctBeDFFA6+ZIempWQMBaejqqfYaUYNa3P5KjtOhDwQdCzRa
 9migtwklYqWSxK859ArT8bW/RtRTU0m0ZV7GJznJlNxg/WQGr33O9mvoIJiMVRhtatocGzQc9
 yEVkV+1P+8IVSAhH4PMdGAAr371DT3jXAljNPvhl2wf4/VNFqPAg4BLyr3oEI242e5jM8rHCh
 0KupWh5l8/npu8bMRqdhe/vnaIB54/JQwvnwPF8BLUcZxu+90AZSGFSrMHlkntMfc+voFDDZY
 c0RubH/Fk9RlxiV1wwlLmZxz58H4Q1+YjvMSNlRQ/aMcHBUOIRzB3i3kxps+zd+hS8zbQPeex
 1XfXfjwuP4aaP6RCPgc0dAdAjfsLDF5X54IPWF70HP+vCv3bMjoRvddeiIG5EGLTa7OcSUU/I
 SND3jUpSUL/qRCNJkL2Qnnx9KEln4eSNtFAYg03UsNL7pmY8vN0RRfSja2U2IZCE3MZc+Fgop
 tAhUHhrquw6UyognU34C2bh0nfBCL9K9lFWpML0qZOAcsJzLIqeElM90W5y/uZaWkzfc1hRK+
 A8J/5zRkSwgErPv1zsvVyQst119Jyrh1UYfdmiVqXFn3CPbonQGd8wfyUVN8qqYJ1o4OCShq9
 MRvHzk0e2e5cldL2F+gjdqJzQ8DCaP68Y6sAiCdPmEu6xMXlC9CSeylpEUgw2MqKRBFuzWtp6
 HAFDgZhQnRbCB6PJaV0GIQZbxDR2kgVQETIBQPqiah77F/ZeSvzMWRDMbxPJ1CT4sJBc4ONff
 OL2vcgxS+Uq13qZNfBWu4fIQOx8XwhlOEsaLWMcSc4Snhzl3LvA7Xs47hyeCbUg9KIBWB7kvq
 3KGl12WYWhtjeLlotTFhxdhydAQfnqha7FayK+F4OG8CvpLm0CLwnrtafdtS/2OxNUeKEcTNw
 REvgRxdSNiFS2Vyzf/uz/18a0ovUr5eTEzgJ3pzy9PB8ignGLzbTDrzqHPGUhp8F81mDOtAfk
 I7DcUOxhuvKwC0hKn1XkY1Howm0Jd8KvNkaO08A6wpvLU0cHPBvHxWq1LdZLudKUo63B5SMDy
 WEDsyQf7ic6/Vg4OjRPYBN6TmqlQ5eOuSW5p8KHwyQQe8JUGMTY6iTRzMSn47IQ4HA8Nxo/zr
 eUGSrww3xksxxB7QJJphJiw6xyIG72llXqAvBTpYSbcyE9CrRRfTkKfH3l2mAh0dRzU5UD98p
 Ddde3hkuSAOajGNH3CwM4Rt9C5JglSNQrbO3j+8lqbLFaHVY7GL2nIV5gCDqPIeZNNOFw8iL5
 scHG/VjxQrgDlK+cDfyUWij3BzqEah5g6UCgjhg0RWWN5LZ2cCVgtlHRodSc1QEUuohAtwE9v
 Q+mH
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_103844_291446_EF1A96CA 
X-CRM114-Status: UNSURE (   6.08  )
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

Hi Zhi Li

Sorry, to steal this thread, but I do have a quick question concerning Ethe=
rnet on the EIC7700. Every time I
enable gmac0 in the device tree my EBC7700 stops booting (e.g. SD card is n=
o longer detected) while Ethernet
does seem to at least get detected. This has been seen using next-20260219,=
 stable v6.19.2 [1] as well as
6.18.0-rc6 [2]. Any idea what could be going wrong?

I admit so far I only do have one single EBC7700 at hand while waiting for =
further hardware to arrive.

Thanks!

[1] https://github.com/riscv/meta-riscv/pull/601
[2] https://github.com/eswincomputing/linux-next/tree/dev/test-upstream-v6.=
18-rc6

Cheers

Marcel

[snip]

