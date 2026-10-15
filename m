Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB80CC6B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 Oct 2026 14:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Jv8ziNJlXPNbrImiv89bm0vlgkuGeTAZkaRAOPky68=; b=sNUIssp/qT1R+mNGERzzd+BL4E
	WSLdf3ogyPa2j9Xl0MmEIbBn77w//DvkomJ/5MiySXS2qVFbmwKS3FyBwH8k7qkRlGpUxIZ340x6u
	QUd8/A/Y/gMnEqENmDaJmy2VconBPdxMfOWM34GdiaWAtDtcLm0kY0OSt/JJmP2JpuY4g7kZCgcuu
	KLuZOoh0wwg7eTtBvW1yn9A3Fv4H47SpIryQ/PIFwC0hp+2wCnz7KSdUntk1v5OmN9i38juFC8xbg
	hgFDYN6p919N9KmOwVf9RCymVB9otZghHSRmNlHU4FOzZKPg5jkHobmF0QOwFvH1tQHgz7X7yqO8C
	eM0MtdDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMgT-00000000QUP-2Stu;
	Thu, 15 Oct 2026 14:43:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHMgP-00000000QTg-0FKS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 Oct 2026 14:43:52 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jgkQ1955846
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 14:43:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=8Jv8ziNJlXPNbrImiv89bm0v
	lgkuGeTAZkaRAOPky68=; b=mBm48ztOA1eZbqumBtIsAII9V7fboMf1X06aeRcY
	qPnmimI85JtRl+STdR+qMyyTYhgpTTtvbnhHofL5oUApKe7B3YvjCVhtxTZnz/5n
	LjMnkDZtZXgtIDGG4GBudEfU6zsSGCps1gGb3AiYvxtlEAO0QZqih0gWmQce8/VJ
	8EOgDCCHaoWgDlPpou0bUhjWk9zZbq19XSp6cfvrxgQ/YD7Ugl6J0GH3av9oSJx4
	IcNgKC/WT3WCLb28dLZ1uiaOj3QsxnLOB+6jTScwQLHpqdDzDNmzIoIt4P3wbE+w
	KzUhiqlS1U8wpMd8YGpnXxoZOu7i3IAjF0XyvznKSe14zQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakdeuef2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 14:43:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb71b1443so1160850485a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 15 Oct 2026 07:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075427; x=1792680227; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8Jv8ziNJlXPNbrImiv89bm0vlgkuGeTAZkaRAOPky68=;
        b=IckqL+ks14uXK2byucJHDWI3oIMD2TWjs4dHKVPmbCNBhRKDznbB/fX41BYOg2tB5Z
         eFao1+WtJAXzMO8epG5o86fRzeg00C9jfLJOPfhRkn3CqQrEXGgCmYclgKWxmLKOAnAY
         jGqe8isKWwyE29nHZiT6TFLSEv7J06mNqcF14mRMiDRbiQ2JXkWQ9xw5T5Ji2VbuJDBS
         QfkvUK0Z0rS2sW91eA31w4ujezZJnrXZMRWV4jbCxenAUJXBwPTIMnWRT2L0219MmtHq
         IqsdZIPFIapsGjG2YCnA2qA98sSWUbjgsWcvGR8WdMdNi/r2zR3jRD8MA/ZJJI2OvvkJ
         MNFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075427; x=1792680227;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8Jv8ziNJlXPNbrImiv89bm0vlgkuGeTAZkaRAOPky68=;
        b=PZV8tkzpt/SF2zuaQ9lQGaR5nSNnx1HXCoy6IyVr2RBQsc4pvdtIKQ34gbqoNu96tE
         4czDGnw7Ygpq7iyemB05IITEc6R7N85mWJEqveZqTU7bOxAUALln4qKDFFDPCxkLqw5x
         N4Tg5N2mXecYJLxB+tdvZKx5VgA5Ge1HJw8Ib+4V8aRdJwfsg8ry2DHPPUZyUwLwqlhi
         Fh/M6qRalfKsIU+Lj6wbFQ9FKEPWTNWoR1H1K+4IamoMJuF4E5wP7HtLgBjMIzxytytw
         yELjIZ58e7iV4ZZc+6HKDU2oVzSJFfPBS9YStRGF5gThDGzb5pOfrts4WcGgcSd7PUBH
         tvBg==
X-Forwarded-Encrypted: i=1; AKwUvBxHLNUj7Ns4stSdxlnn94j6fcxezR4HsGgNIt8280YDfT1kIZLS6xMSsoJteEdCJKmwVLvcJu6Z3RReRw5p4aq7@lists.infradead.org
X-Gm-Message-State: AFq9FYKVUr5jsMLudu06pp8qdXx6ibEZUcNMPUdmzW2F2PeVP0clWSc3
	5NVSHP8nM/9u8JDMpQ+ph0lp80bqC4PHsSn2ZLKdgbuF9CncTkvQUJEIUeL4SP7jqc05U+oR9NN
	PH6Qq130HthS39hSKX9K5esAYdfUpc+8Kr4H5BrHO0E6zI2gACxb34RIVKyc4phyOWh5rcif4ro
	m3iw==
X-Gm-Gg: AYBFou0ao12VA0dxeyDzCeKvbp5YgM3ifJZXT+p1NAke48cwKpXGsYbEDB0etfWVCP9
	kdXlcrv/JJ+UXucF/ezZtgnTNYCSESY4ODmGPTN32eHsKeb2+K8T2wWMKBGMLXYbtC+/phF9Zu2
	FdkrUk/1jfd5rFBM22p8LLI92fkfC8+VXbW/xkL2yFlEuJmO/8XZugD+vMhg2WeM/Lm9PEqElA7
	DWjKzL8bviXzELT3aihrPu2MHezY51Kl9v6ARrOLZWJwUAfRpc9v5VQGYk9fKlDkaB92/8Uaq47
	iWRw89+zbpGz2EZ8iApoA5CsqKZ3w21uzDr3WBAGFVwfkVIk/YdVc48SHMgY7kbwZsspiYtdgRL
	8oxFgqHY4RnansQ==
X-Received: by 2002:a05:620a:4449:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-93ebd263d3amr3069402985a.44.1792075426944;
        Thu, 15 Oct 2026 07:43:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-93ebd263d3amr3069395085a.44.1792075426160;
        Thu, 15 Oct 2026 07:43:46 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48df758258fsm3327631f8f.17.2026.10.15.07.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:43:45 -0700 (PDT)
Date: Thu, 15 Oct 2026 16:43:44 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: netdev-bot+sinfo@kernel.org
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Ong Boon Leong <boon.leong.ong@intel.com>, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, bpf@vger.kernel.org,
        James Hilliard <james.hilliard1@gmail.com>,
        Nicolai Buchwitz <nb@tipi-net.de>
Subject: Re: [PATCH net-next v7 0/4] net: stmmac: introduce XDP rx multi-buff
 support
Message-ID: <atDmoPpmzgRoaOWj@lore-desk>
References: <20261014-stmmac-rx-mb-v7-0-5d2d70f052cd@oss.qualcomm.com>
 <179198374828.320699.17103999780938670424@kernel.org>
 <as-Ef22VEKQcZ9QQ@lore-desk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bkfl3mL1k4wIuKjB"
Content-Disposition: inline
In-Reply-To: <as-Ef22VEKQcZ9QQ@lore-desk>
X-Authority-Analysis: v=2.4 cv=OdENnRTY c=1 sm=1 tr=0 ts=6ad0e6a3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=9R54UkLUAAAA:8 a=zPHIA2Y_rLiAKEAzPmIA:9 a=CjuIK1q_8ugA:10
 a=hbj8jUmztM6ql5xhcn0A:9 a=NFOGd7dJGGMPyQGDc5-O:22 a=YTcpBFlVQWkNscrzJ_Dz:22
X-Proofpoint-ORIG-GUID: FweXpB_VKvXY3Det6LA9mWCXkx11Sfh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX26ubQsz5Sqco
 sN1PhePzWQmONBTqMrMZnYOB4yA4o/H+RfH068iBE5s4A/7+NcVNVzqCHHHTabvBZzFzQEGZw94
 ubh26JEENZDnYPNGWk6YP/SZNhpipFqtbXWGndJ369PR0W2rhnD7342nOsvbkJC3o/y1goNZJHG
 fbO9cp2eU1QNRlJxQQM1FuPu3Smoa48+cYoLMYpiXKwlTYzGyc1JO3qlnvxOP6aNnzTz1Br+jcV
 Y9s2z4hdeQ5R5lOCl7adW+1FuqqbRx4tQrtQjYlY1NbrHg54FIeoXaamdxD7pFE/54UDYg6nzoE
 gp7kM20DyZ9+eBwLj2qv4V6QRzauPDAzIy299SrMG5tvVN0Al738V1v74VKwoY/8meO8JDyZi9r
 vFUdvhqDJEm7vAKDyl6Hsj1L4hHmEF8xbMSQgQI6f7BAoEgYiMK0nnRuNQtV7KFJxn+04B/xYfx
 4KPhX0c617ZnYUmK10Q==
X-Proofpoint-GUID: FweXpB_VKvXY3Det6LA9mWCXkx11Sfh1
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX16ix6dzybwDM
 YTKCGiZFJDHtN/1jUm2XHXcnElFEznngTTimX7jAlhmDZOztLmdSlnpcPClOv8gHYitCgXFCHp7
 bPm28Muw5E0OFtw26p+Lpy1AAUxkX9A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_074350_833013_A7413114 
X-CRM114-Status: GOOD (  29.53  )
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

--Bkfl3mL1k4wIuKjB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> > Hi!
> >=20
> > This is an automated message. This series looks like a fix, but its
> > commit messages seem to be missing some information:
> >=20
> >  - How the issue was discovered, e.g. hit in production, hit during
> >    development, syzbot report, manual code inspection, LLM or static
> >    analysis tool scan.
>=20
> The issues have been reported by sashiko.
>=20
> >=20
> >  - Whether the issue was actually triggered, or is only theoretical
> >    (e.g. found by code inspection). If it was triggered please include
> >    the symptoms, like the stack trace or error messages.
>=20
> The issues are real bugs spotted by sashiko.
>=20
> >=20
> >  - What hardware the change was tested on. For driver fixes please
> >    mention the device (and if relevant firmware version) used for
> >    testing, or say that the change was not tested on real hardware.
>=20
> I tested them on a Qualcomm RB3-gen2 board.
>=20
> Regards,
> Lorenzo
>=20
> >=20
> > Please do not repost the series just to address the above. Instead,
> > reply to this email with the missing information, so that reviewers
> > can take it into account. If the series needs another revision for
> > other reasons, please include the information in the commit messages
> > then.
> >=20
> > The evaluation is done by an LLM so it may be wrong, if you think
> > that is the case please reply and explain.

This series is marked as 'Failed for Unknown error' in sashiko-nipa:

https://patchwork.kernel.org/project/netdevbpf/patch/20261014-stmmac-rx-mb-=
v7-1-5d2d70f052cd@oss.qualcomm.com/
https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261014-stmmac-rx-mb-v=
7-0-5d2d70f052cd%40oss.qualcomm.com

Will the AI review still take place? Am I suppose to repost?

Regards,
Lorenzo

--Bkfl3mL1k4wIuKjB
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatDmoAAKCRA6cBh0uS2t
rAGPAQDOR1UCr5HtCIe9Nw2G2i1dLH5T25axrA2WLWy1e+QNnQD+NEiaGtvnHBvQ
+ig5hO6JzXsfluj3NPTkahcQvLfiUw0=
=PWr9
-----END PGP SIGNATURE-----

--Bkfl3mL1k4wIuKjB--

