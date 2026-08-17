Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D394BC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l7cD7zJIO/Vbh810jB9n/zTXP+2YLhUqswVtiuzsEmw=; b=ThA+agpCkE8rnHWtdmqkgfXz0F
	buMADStFGL6Rk5Z+MTZf0+ZqBhlauBJn2weG4A18OAlSOO9nZ6fOvOHQz7LrQJgNWtep7YVL3Es+x
	ATwgDuzMG7g42ERF9/Svm2xei+XD1cwU+zLHfMn2hDUhTK/ZdcFyoyiEcrlRYGI50NN0X+AQ6UnXl
	8KxGqpg/TTJAjrY10LsmgZSxY5+ScGN966rzwX9/9ag4t6Q4gyuZ5R4/CAknIyP+KNcuP6ehAIBK7
	ujlZeEt8IOziiIvt+/Mm+ARueiTvLPuAYoSRQdHqpzzdzpQkGh5fIIPGG5DRs/1fEo+uSRPwghGXq
	ix/I8aqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww2uB-00000006iYY-49zZ;
	Mon, 17 Aug 2026 19:21:55 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww2u9-00000006iXw-2FSj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 19:21:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67HIR9LP2638289
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 19:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=l7cD7zJIO/Vbh810jB9n/zTX
	P+2YLhUqswVtiuzsEmw=; b=BxUHy9pNj+4euHlp6Ns+cS3KauA0vkLEqF4dw46x
	uNO6jKYUOW83vaS+EU0G3j3qAs2wqzitr8ibP1tXv2ByRmJ0bVbuzxkt8U3yrXcv
	/dQkHOG5K7W8HhSQRqe5e88bMI2wjpMu32wnSuyHoEeKzijMJD4564+mkD2gWNVJ
	TjzsbHfAnfg0qIWE7CZMnSwCQBOGrPBT6772txMcSdJ+16AauKuuOSwv86YVu/Pj
	Wk6M1RO8839RZ2e4aXiZ6PbVT8swGXqHkxPu3DJnr9uNUkM2bAlKL5Tq+fHU7dXK
	HtCo4Hu5Nn/f24QdlB7OcPYn0g2/qWtH/Trjzog3x6AB9A==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3xx7jjc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 19:21:52 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so2525571a12.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 12:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786994512; x=1787599312; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=l7cD7zJIO/Vbh810jB9n/zTXP+2YLhUqswVtiuzsEmw=;
        b=GHWD6eXgUl79bvNO42RrB+xAroD0zpdzJ70npktVCk0rhB4e6C3QJ/wTrJ5Cyxqipy
         DkRlBRcCKzv6fkkITmvT51LBf2UDySTICa8Pvx5Tm3v7SZQF/jeGomj+9ui5ssQnf87/
         VSd7C1iVx5vMvr83+OvBb/kjVFufHJLikCW1Ccws51hKdhZsvyod2lLNNKADHBYk/frJ
         3ALaRiLPGmGO+zVLlfVVCCW+EKtJpzhdzB0fKsDoQDCdOhR/90tknG6qytDzKH+R8bIQ
         ZaSLnu0000yBs8szlI2tjA8lSKeqdlWjJTBcaIQxL8ypG7Xatjik7Y9rmzm60XjkHlqT
         ordA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786994512; x=1787599312;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l7cD7zJIO/Vbh810jB9n/zTXP+2YLhUqswVtiuzsEmw=;
        b=cdjXmblysMHtyUn4lRNudAANNmmSJk/wV+hKoHDncCA67OFBtLVkOOJfmX8Z5i3euj
         SfNXMwjeyLuCBYRsJeEwyeFzvPsQosrMPLPTQ9sVrv7Kx27ttvZ+peKvWV2Cl/r4vTZe
         GajDv5mzJrPmOhiqxdQSdyb57PRHpPIUhUv7tQw1cUIJmfrOmrUGUkrW+LoXhZMDFWKU
         XHZnxWWwnGlx5D/VT1V0tJzgtXkSmc4iq85hhJ4uNi+0LsaIlMfd0Pj8hCEsmONlEA5I
         k2RD148INBu/gZ7YcK7EY/aY9TnA9fzDWjzd2UZdFFl8wqD9jlQV+kdWAcOKHYMJ2HoD
         YvLg==
X-Forwarded-Encrypted: i=1; AHgh+RokIySVlR4iMMkaHNmlvkg1RPfxpC5FViRdB4+E1QD9YcJ26bGScV64GOVA6PwdVbIFlxISi+q0vAzy8kXhY7I1@lists.infradead.org
X-Gm-Message-State: AOJu0YxyOP0+kpj0FHQZxlE9dwLSJPsuwG7PTQ1gHdERixlFUXX9uH8g
	Hh3TwJ56DE/bVtbaa41D9MYk8O2O6TavCoN1cMA0ZzT9QCYd9C6Fm25bSCoH9FF13QyeUJa63C1
	Z+sy55xEBI9JmnA3WC2GP7ydKjzgG1XQ4qx5xQbG0CpetQv3k/hUdh8k4aW7fXCzY6XYHujrwKL
	BB/Q==
X-Gm-Gg: AR+sD11chTudT6ScIs6XBGpJiEb3GJcGirrXjR6nO2ZX4PMqHSmd2+H/DQeGyKQShkq
	Dk6a6pskpidc4B+OyiUKz2N/Jek1Z/KN+oV9KSR2ZDhPNIFDPuvLu6IsVmJ9ZI2AjezQM0IJreK
	7T4i5zcnHIk03OgB1EGitBPdAeoDZsRhkq9UmMYABpdwXjdIyb9Mv4yhBsaJy+hXyeGMBFK5XhR
	SkZM/ZYe6xB6IHt0Lil+H+VbDmJzuO1MXsUgfQ4DSA04oqPPZjXMJ27fIEd6YA/Wz1Nj7ofvJC/
	pdJbGUTAQFa2hKoDNMtzYq5womUXGifkEiiABQlWPMuoVJrT3grN0+FOoatO7skzwGSFk3zW3Sa
	oW5vxPlNRlq5nvw9A/Qedmtsis9oWvD7kcD2kaHb9837m0tESyUqLoA==
X-Received: by 2002:a05:6a21:7a96:b0:3c3:b57b:6459 with SMTP id adf61e73a8af0-3ccda403569mr2887268637.7.1786994512250;
        Mon, 17 Aug 2026 12:21:52 -0700 (PDT)
X-Received: by 2002:a05:6a21:7a96:b0:3c3:b57b:6459 with SMTP id adf61e73a8af0-3ccda403569mr2887177637.7.1786994511442;
        Mon, 17 Aug 2026 12:21:51 -0700 (PDT)
Received: from localhost (syn-076-081-086-222.biz.spectrum.com. [76.81.86.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141530793ccsm9326393c88.8.2026.08.17.12.21.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 12:21:50 -0700 (PDT)
Date: Mon, 17 Aug 2026 21:21:49 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v2] net: stmmac: improve TSO/GSO queue selection
Message-ID: <aoNfTZbXWCQFjtsn@lore-qca>
References: <20260808-stmmac_select_queue-tso-fix-v2-1-67175b29772e@oss.qualcomm.com>
 <anybM_3Rdg8X8CMs@lore-qca>
 <20260812161038.5602eac9@kernel.org>
 <an4qzUrK62-rN7Q6@lore-qca>
 <20260813172156.0243cb7a@kernel.org>
 <aoJwbQ-v--cTcysz@lore-qca>
 <20260817094140.0e92f54c@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="R8sUz6w0t/9s4Rjn"
Content-Disposition: inline
In-Reply-To: <20260817094140.0e92f54c@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDE0OCBTYWx0ZWRfX8N1Ne8E+3KGh
 IBnqFUpCQB3WGIyu5NeaWogzOVMid6fxTMpkreTEvB8Wu28tlq9uJq4QlC/aVoYNXqb1+gJC8za
 IFWx1p3meV9exwnzW2HmYIp8xacAYOM=
X-Authority-Analysis: v=2.4 cv=TK91jVla c=1 sm=1 tr=0 ts=6a835f50 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=tSTSPR48TLbTv/DgUuj29w==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KhV_WtukMbZTWkMfzPsA:9
 a=CjuIK1q_8ugA:10 a=qldvxho5sSfUmWRlgdwA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: IelCNywF0R-SnqWXvP237f5YNrW3Dle3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDE0OCBTYWx0ZWRfX/vk5SMbBmwsr
 dSMYI5hF2UrWg/7AevvPRdq5DV+QLrCvGujzitX55w5H0VbnnwcFVXSo+Hc130eGiss/BZCmUos
 OJAAo4HXk9bV7AXlLjnEf8aiBggTEqqq2SB1B4rYwc8l5lB0aMyM5FZ6ETkHl/qWXESrVzS92zz
 k3J+WoUCD51ver8kDg8nX//EsxcxDKNURXIgcv+PTxMDl0qSAFaxMbf9sAfncnkTzoe8xgl1fsx
 2KZVIOVhlf+p4rK0tfyBrG3r3/Tu3kB1JFuaVm5KqK2Uvy3cmGpCy4FGOaA7cP3RQwGrIGU2MjY
 nhGboQcoeHxqD5fcFG5fxQI6Mvj7Ok+WJ5r5Z2SGCf8Hv9roLfIVcVRQlEcH4xA1l+S014GdlCG
 Wrl+ELdtKhzcckCvzc4vqjaQNCS+tuTw60ubFqm47wneTSYzmPkhomK23EWzBK3cHVJUBHRzT16
 1Z7Z155iyEHJL7jx1vg==
X-Proofpoint-ORIG-GUID: IelCNywF0R-SnqWXvP237f5YNrW3Dle3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-17_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 impostorscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608170148
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_122153_582243_5138A2EF 
X-CRM114-Status: GOOD (  39.27  )
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

--R8sUz6w0t/9s4Rjn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 17, Jakub Kicinski wrote:
> On Mon, 17 Aug 2026 04:22:37 +0200 Lorenzo Bianconi wrote:
> > > > thx for the pointers. I reviewed Russell's commits and I guess we h=
ave two
> > > > options here:
> > > >=20
> > > > - manages all the TSO/GSO checks in ndo_features_check() (stmmac_fe=
atures_check())
> > > >   and disable TSO/GSO if the selected queue does not support checks=
um offload
> > > >   or it has TBS enabled. In this case I guess we can drop ndo_selec=
t_queue()
> > > >   callback completely (it does not make sense to me to always use q=
ueue 0 for
> > > >   TSO/GSO packets, e.g. it does not allow proper mqprio offload).
> > > >   Please note this approach would introduce some performance regres=
sions with
> > > >   respect of the previous implementation.
> > > > - implements TSO/GSO checks in ndo_select_queue() callback
> > > >   (stmmac_select_queue()) in order to keep TSO/GSO enabled if the s=
elected
> > > >   queue supports it and at the same time do not always use queue 0 =
for TSO/GSO
> > > >   packets (proper qdisc offload). Please note this is patch I am pr=
oposing.
> > > >=20
> > > > What do you think? =20
> > >=20
> > > I don't know this driver, or how it's used.
> > >=20
> > > From the commit message it sounds like "if the packet wants TSO and=
=20
> > > the queue has a scheduler enabled - take the packet to another queue".
> > > Presumably you know why the TBS is enabled and whether the packet
> > > should or should not be going to that queue in the first place if
> > > you're sending the patch? What is the use case? =20
> >=20
> > Reviewing the driver codebase, TBS and TSO can't be enabled at the same=
 time
> > for a specific queue (TBS is not enabled via DTS but it is hardcoded in=
 the
> > driver). Moreover, for some devices (e.g. dwmac-intel, dwmac-mediatek, =
ecc.)
> > TBS is enabled at bootstrap for Q1, Q2 .. Qn, (Q0 is never a TBS queue)=
 while
> > for others (e.g. dwmac-stm32, dwmac-sunxi, ecc.) TBS is not enabled at =
all.
> > The current codebase forces TSO/GSO packets to Q0 (since the current dr=
iver
> > guarantees Q0 is a TSO queue). However this approach does not work with=
 qdisc
> > offload (e.g. mqprio).
> > I think it is clean to just move the TSO logic in ndo_features_check() =
and drop
> > ndo_select_queue() (previous option 1) but I guess this could introduce=
 a
> > performance regression with respect to the current codebase (we could d=
isable TSO).
> > If we move the TSO logic in ndo_select_queue() (previous option 2), we =
could avoid
> > forcing the TSO/GSO traffic to Q0 if the selected queue supports it and
> > at the same time avoid any performance regression with respect to the c=
urrent
> > driver.
>=20
> Sounds like we don't have a clear understanding of the Intel / TBS use.
> I'd rather risk introducing a regression for them, and have someone who
> actually knows this system help with the fix than accumulate
> incompatible workarounds.

ack, I am fine with that. I will fix it in v3.

Regards,
Lorenzo

--R8sUz6w0t/9s4Rjn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaoNfTQAKCRA6cBh0uS2t
rHucAPwNAt0gkFEhUci2GLx+gnpNwFwKJi7Sb5fWvEFWhLzGDgEA16wWdP80EihR
RWpRu6f5NX+XwxLo8nqNpJdEzwzQAQU=
=BORM
-----END PGP SIGNATURE-----

--R8sUz6w0t/9s4Rjn--

