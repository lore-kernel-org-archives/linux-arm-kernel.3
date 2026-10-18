Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CE1CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 17:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T0p+EIzAf6jC8zjKtsjkjlrPwlROr4CztFJTT33WVqk=; b=Mrrxq2iopj49xw6hzNAZzK9WDJ
	pUmyWhOp5Aj4m3nuQ1gw1amG/CqbikkUKgC9mOOaT0i54grm+QIO1WnsSkdLta896UdwERvWs0swX
	bxqARqwnGtNSuSafPgrNOhyToSeTaQX5UcUmVdP6bCLC6RdnG018Wjj+Nv7Aj9JaxtP7BYQ+KVASz
	iy13QrDs9Sp0K84UvNak0wDHvb8WLqy3cVVQut+qkZurvrjss8DhzIyXCf90kaGdX6s/fY7dMJfwd
	Z4/ZEzFFji7QXsjAqSGWFUEfKMcbc46kPMuXTssVhnnEWFm6MVjH8lJnTQYu+62PbU4pB2YpMJjLW
	a1vJasSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIUYG-000000065QK-2If6;
	Sun, 18 Oct 2026 17:20:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIUYE-000000065Pv-1d4u
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 17:20:03 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69IFRFiZ1196587
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:20:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=T0p+EIzAf6jC8zjKtsjkjlrP
	wlROr4CztFJTT33WVqk=; b=i2FtwSGW8MYD3I8B6nVJFFiB5dVUYIUDadrih8zK
	VHgl0NMp2nHbu2ek0fGkxNqFJOS91wSOpwPQ+RGnjnJb4yeaw6wURDsWITqUy9kq
	tkRcVIX0su71SVgXE6R1U5Ug+hprBHzXyIawRzJBohzV6mmwngb7RBO2nnOSSJsK
	AwewnhP4MqqMF7ZdztbTQycGeB3fjzqHuOW5IMiytBeNZZSvmb0pZpo6QestzOeY
	RRra2dLBoSyzERCfFmb8ifsuQI1MucmYqaSa1IqUV36NSKpIgwFgvfwnDwdEffDF
	bAUsDVzsEzaJBP7oRf6ekU1vNRLeMoTuA4HpJ2SHcl85Mw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hbxqfuu7a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 17:20:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2c0e6653so250159085a.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 18 Oct 2026 10:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792344000; x=1792948800; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=T0p+EIzAf6jC8zjKtsjkjlrPwlROr4CztFJTT33WVqk=;
        b=TIlECvkkhw53UaBBd3YjMWrhl0P+KLaWlCLtnhvY/WCq61A9DenWhwLcedwZzrDEfc
         nKtsh3FmeY6/gM7cMrQmOPBwVvP5F9arHLZfnCWfoNnTq+YY8msINc3I0jxFd1VjJT8x
         0APYO8qtzkq8ag+2FjnN5f0z+DWVUcozPTCoN4ORQqIr84vh1P1/D7U8/P/xMP8I6UA9
         50A8OxX6I8LP6qEUVTNQ8yW08XtJXK3/dAmDD1I0JiRegKVvjwINgnjpVYRMhlMfNcm8
         qNwd5BOvNfL6HY4j70o4JB+y4AAfTWrEwkOzUmQP+Y5XL8NUDVsf+vg3RF9My5aCReYa
         PR2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792344000; x=1792948800;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=T0p+EIzAf6jC8zjKtsjkjlrPwlROr4CztFJTT33WVqk=;
        b=xh8xx/hUaRAvVv2CrvXX2xM/WuZ9GtWF9Kz7gj4IoPyPiUcZtDNcuHe91Eluefx3bC
         P4C36bgLoieYfGOwGUAvwnjWni7uQRsrgUww0pFDiHA36XO1vecN/XGDpbi4fCDmXzev
         Vr/xdBm7TgJREkeSyxh0wMbaopY8+4d1ktPVUQgfA3Y32XFVXllrFc61R5FrO6NVtwHz
         +SBy3fYZRg1NkkKBDLIskTGvMRv2+OaMy4L9rDnvb7KUM57DMh3G0PZ+ix5sLFk0gTvN
         KmWQul56j5c3YGPTKGR96eWmm7aN9oIdNP929pVc1orcKAIwXYtdQQOj5csdSZ5Ky8bF
         K9mw==
X-Forwarded-Encrypted: i=1; AKwUvBy29rYuLfGHi5Z6tdUo8Psd+LIJ2tYGYME1NK6sE89pc+2eO+kwUpfTWYm1jTm+YFC1tFjYLmg1Pv89FNRvWVR6@lists.infradead.org
X-Gm-Message-State: AFq9FYKcAToer5NRjvRRp03Mx4EotOppPxzXw2gYaYpDAodU1LymMPcV
	PR3JZWg0zlbWcz3Mlm9yFEi1Q6sTKP+6MJldSWujSyxeEovLSoQ4Hh98cE1QMUqIeqcHYa7zsE6
	iThjUUK/kmprJiQM9/KyCkthJINZ/U5yEM9ovXfYn5csoDwzGOQFOeilkhoIb20yzDZphmnC7S+
	/8yg==
X-Gm-Gg: AYBFou2fsTnO0OM9/0zIiucIne2gPBVXKONDC9yfVgNbsgF5XaeL5yoOSlGLxcdqWB2
	UcsO/kb9Ht9vmPylunWfu6DEexIZQMPjRhjFaisgFp6KIobbMlK8TGJuig7IollldVKmLwrZEyX
	bBfqyMDKcYRU2Z63kBiS7Rr6BtXKpetnK237eBG48DdKfWmhZzpC8U1qECOkgsXdCZYgMNIP0Iu
	n2vo2u8PzfiTJIfvcFzHibCgNCMOZwcbCSZwDLT8borl09Uq8bArO8CpAKy5jjmnV/pC5CbuHqB
	BXPqcAeseKRdfL3uBgeMZWzedox+dYSni9Y4QR5fLX/sDBEtW4I8Wf4VoWuEyYjTApHUHdD+tZ8
	9i1vJeeQK595siw==
X-Received: by 2002:a05:620a:198d:b0:93f:2463:f784 with SMTP id af79cd13be357-93f29dce82dmr927324585a.66.1792343999464;
        Sun, 18 Oct 2026 10:19:59 -0700 (PDT)
X-Received: by 2002:a05:620a:198d:b0:93f:2463:f784 with SMTP id af79cd13be357-93f29dce82dmr927320985a.66.1792343998916;
        Sun, 18 Oct 2026 10:19:58 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd503a24sm18085517f8f.49.2026.10.18.10.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 10:19:57 -0700 (PDT)
Date: Sun, 18 Oct 2026 19:19:57 +0200
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
Subject: Re: [PATCH net-next v8 0/5] net: stmmac: introduce XDP rx multi-buff
 support
Message-ID: <atT_ve7qmxaE9ZBl@lore-desk>
References: <20261018-stmmac-rx-mb-v8-0-5f58c0b25849@oss.qualcomm.com>
 <179234329183.3290.15960565045054355734@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="AgvfZen+EKhfDhbF"
Content-Disposition: inline
In-Reply-To: <179234329183.3290.15960565045054355734@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE4MDA2OSBTYWx0ZWRfX5znOrP4wtG7x
 oGJJsrBJPPCBYsAdcDTWvOeAZYHPnDjHelvAPWfkOq455k4BtJPQzZ6RjFz2/m3wx3y7wi+Pnfv
 2f72qZe9S9baerTQbYGZBVz3ubUjl7w=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE4MDA2OSBTYWx0ZWRfX257RVRXctOwO
 e/bomMKiw8CbUItRqy8wazYyC3o7iu0FIM6lSqJzLXqP1sNGkqzgZpEcb7/qPZMKf/pH79JASe5
 NpMgrjxMvpt7i0q73LZu93NOt0cToUmi2zFTNrijWIQTMa1WYY47mIIwnmluaINPT+nOHQMzoUL
 yTNxxJI2Gf0MFX8URqIwk/FcsFWLgdBUcuqolAPl9D0Lc9/NCF6umkY46Y0DPtwwt7lAFlL5J3/
 og5FWVgW+121J9fYRyAjH+e6UZ68s5ahM2MmOYlPtRbPc3uSruaDVNq6svX906VUvKKNDU1LJ9Z
 uvGSp0W3UWyWEU303LWLoMdX9TANQd+XplNcWRFH7a4jm6kQPxC9MFQS130LTbsq9NPBSHChpZN
 eVCIVWGo1dzq4aSlp/kjhYof6uA8idnUQyxJtP1RiYbuHo66P0jA4YHilyqaq5QAdo2KcXm1zlc
 aY1wqeWRLmGzGsfYpPg==
X-Proofpoint-ORIG-GUID: hfl_Tb29ubFIav54bJPxhzTRfteaA3zT
X-Proofpoint-GUID: hfl_Tb29ubFIav54bJPxhzTRfteaA3zT
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ad4ffc0 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=jeKYxtEjmYGD5WCmXysA:9
 a=CjuIK1q_8ugA:10 a=lBbZA46aXh9jGIf2LhwA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-18_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 spamscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_102002_436608_CC5CB949 
X-CRM114-Status: GOOD (  23.33  )
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

--AgvfZen+EKhfDhbF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi!
>=20
> This is an automated message. This series looks like a fix, but its
> commit messages seem to be missing some information:
>=20
>  - How the issue was discovered, e.g. hit in production, hit during
>    development, syzbot report, manual code inspection, LLM or static
>    analysis tool scan.

The issues have been reported by sashiko.

>=20
>  - Whether the issue was actually triggered, or is only theoretical
>    (e.g. found by code inspection). If it was triggered please include
>    the symptoms, like the stack trace or error messages.

The issues are real bugs spotted by sashiko.

>=20
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

I tested them on a Qualcomm RB3-gen2 board.

Regards,
Lorenzo

>=20
> Please do not repost the series just to address the above. Instead,
> reply to this email with the missing information, so that reviewers
> can take it into account. If the series needs another revision for
> other reasons, please include the information in the commit messages
> then.
>=20
> The evaluation is done by an LLM so it may be wrong, if you think
> that is the case please reply and explain.

--AgvfZen+EKhfDhbF
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCatT/vQAKCRA6cBh0uS2t
rMCUAP9wts/I/Spdip/Po0TyZ6S93pscCx7yjQHQeCpXz5zWsgD/XObM8IQhNJgO
JwuM9ruODNNYhXQtjGzh7mzKxktZmgg=
=u01+
-----END PGP SIGNATURE-----

--AgvfZen+EKhfDhbF--

