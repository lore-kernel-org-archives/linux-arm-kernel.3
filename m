Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C8ACA9EC5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 21:17:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N2HI8C7LvVnjvprSiL/yD01Xdxo6jYD3Wpi+RAikd0o=; b=AsWe/PBhd/8RznKJKxsOSv4FsV
	9997Kpeh7a9sfQy35cqZ/A37qmEU3Yi2v0P5KZTnmQ4ozjC2w9JuTODdEU8L8LabnxY+idWM+EAaz
	LO4ltipg5P8wkfaLnqlFYhWTJLXc5Ximp8+KJlBaPa3YckJdMYD8X3U1ey50Bk4ai30Ra2y3dHTBE
	+XQwxWeuoVMgzkbNmnaTBsC81lw3RgHyMFlxdLaC1YBZ5Jq/Byy7bBaU8+7e+eXXYjimc8DDFUmfh
	ZdoP9V3EuOgjVBwBztlLjAB08vbbQkgIpeTNan5Xs4NTzrfVAlHPLIKrabYw+T24rjEWoqVxki0zh
	d2SVbV+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNOV-0000000BX1M-0tbI;
	Mon, 12 Oct 2026 21:17:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGNOS-0000000BX0o-07yv
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 21:17:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69CJMnAg144092
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 21:17:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=N2HI8C7LvVnjvprSiL/yD01X
	dxo6jYD3Wpi+RAikd0o=; b=n+uK/lirCF/sKTXGK2l96GTBMbfcuCdYni6ExXX6
	ISY4IxfhnAhVVWvIaL7uPHvVdqPXAWJ2JvEJdCsAq/qTMOTbKotkhDIUTLh7ZBG1
	oE1RFEpc4ioVEWzFwGCsrUk+egdrxwRkmiIePutDbjE5j2CDw6FDfNH/5jQNQkbv
	mcG/UYBTwfrdKt/HZ4hNMgfQ2RfAWGWI77wE2/7rZ1pQ+IZIwteyFzfm5jdRSaHz
	y25xs3MwZPwjxyDGvny3GeQf/cEuebFVtCiT9rTLCXco6sR9noLi2gi0kXDFnxaa
	R5hkBGFDHpubVZSZPNCR8igjflYd2gx04QoDyAESiSnlOQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8wdraumw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 21:17:11 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93cbf2fd504so408410385a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 12 Oct 2026 14:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791839830; x=1792444630; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=N2HI8C7LvVnjvprSiL/yD01Xdxo6jYD3Wpi+RAikd0o=;
        b=Ex51cSYv/5HJtBLhhvoadDUcy9XRR4FFjDdhDAAi0IHwiSMsfv2E2lqOEbPMVlObfO
         pRhDImooE2sPz/McJOZL+zpGJdvXsMU68svHxBPaO8y2rAAfJBwo5SfRc6Nk+ej1JZbx
         XhkCqDH8QYQqRfLhcikWqBaH150mwx6znXS33pBLTKlEsouDRFj49Gpa/qsv/0zL91s9
         1XEKDsgUZPj0lyzWynxViqbiB+tSnLLLkjCezDu40h0UCk6gNl4JvAn68NFcFFtvaskQ
         2GXEbXxdGf/6UV6wYKNRbGX20U80lXbAmvvcrkrt32kPxEp37IAmdNp8Sp86C4DY1LZA
         98TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791839830; x=1792444630;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N2HI8C7LvVnjvprSiL/yD01Xdxo6jYD3Wpi+RAikd0o=;
        b=QoLIGMAS81kgImbdgNQFUHOJAKArmMzSajmj9/aLVFk+HAum61Mxbq01wiCATLyQxK
         RFoQH8iKXegYQdbgSYWgclHH1LnPFflWUliyUSK+BasLbiLOvqESsp6NVfmjU75rNtQO
         sVioNNmkvwHK7TzPXcuswsCnI4/5T/BgcFvXFBG0n/5tnRbp2yNcAGAhrIvh4PRR2ZOm
         Ez7zZSjyrdVmAvGp8ckrfn9wvCXnNFgubMyw2dv3sCppEToFdc6QDykZPe/u9qJGx1vN
         PDyPT6P6obplECLYL/3en0gPGUXouNq3AkfXecI9e90HBndConMdXPNMgoYE9E/H9NzB
         cJ6Q==
X-Forwarded-Encrypted: i=1; AKwUvBwToZkw1DxjJxlur7vYCyMeIHontZROGojfBJZx0J5fuL7GyiPayVCe+1QPQIQnCdUXkhssSkmBSps36ohDZ6HE@lists.infradead.org
X-Gm-Message-State: AFq9FYLAlWn/J//Yf3vAE2T8jJhtqgBfwpUSs6XW4KH2qhJMICPI4M2l
	N5Exllpm/psgglBc9izyaOiPIA4ObIwDCKpCRInrAFe/XCyA8dw/Nc56Bc8QICgnQnLWvngVN+l
	bz3+RIVjf+UWLhPb2o4T7BF+w/ESb0MfOsTqYQjl8WOfYdP6Wronrz3SN/SvL7iAuZu+7E4DFE1
	HWhg==
X-Gm-Gg: AYBFou1d+KEcQAmvrj6EXkaDY9rwVcqalJv013NXFbDaPbUXaxu04nhDHS0bLOrx+7j
	NMK3fyBt4NgFM0fjb++sSKKgKyTGNPZkSvyEUHBI3sZQ3erA318NdM/943/ZgEKs7PZp3whSBre
	k0N8eBwUwcZoRZwgAni5DAEg51amXsAQ1wgB5MrA6jPa2QpIs81WMB0ZE0Moa1ot+7F0mMsz8Xl
	+BjzSQRBIzFNP+6y1/PGExt6Lk2wmwbpJn7/YDb0yPtR/2NN9HuBkABvs1MUCiH68B7w7d2812L
	swKsVc6Ugpwd9HhrPDBD+cnXx93/njPygWarJUDwHsuZbjAKSu6QNv1JGV7YKOAx655PaaBfr+M
	/DcV32AluQ9+FgQ==
X-Received: by 2002:a05:620a:bcb:b0:93c:82bc:146c with SMTP id af79cd13be357-93ebd259af4mr1792544585a.37.1791839830067;
        Mon, 12 Oct 2026 14:17:10 -0700 (PDT)
X-Received: by 2002:a05:620a:bcb:b0:93c:82bc:146c with SMTP id af79cd13be357-93ebd259af4mr1792539685a.37.1791839829438;
        Mon, 12 Oct 2026 14:17:09 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18beabbd0sm364159745e9.12.2026.10.12.14.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 14:17:08 -0700 (PDT)
Date: Mon, 12 Oct 2026 23:17:07 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Daniel Thompson <daniel@riscstar.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>,
        netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: add tc mqprio hw queue
 priority offload
Message-ID: <as1OU7AbxQKi2zWC@lore-desk>
References: <20261006-stmmac-mqprio-prio-offload-v5-0-d7da93419784@oss.qualcomm.com>
 <20261006-stmmac-mqprio-prio-offload-v5-3-d7da93419784@oss.qualcomm.com>
 <ase3UrUehtLY6b_5@aspen.lan>
 <97bc33f6-1566-4449-9343-9e3463d5b8bf@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iPLAchsNbX0Ln+SK"
Content-Disposition: inline
In-Reply-To: <97bc33f6-1566-4449-9343-9e3463d5b8bf@redhat.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDA4NCBTYWx0ZWRfX3EIqO715kET9
 bT7U3ALv1yU/NkKkH0g5VHcPZDR1sRN9aBtILH5n15Bvmwh1JJaKF1Bq6Fb0H85/1kbF+bHM5jm
 oevNl8Sdtv1bjATTh7gjgNHaei5or9cj2sSCx0EVvY5SxdIpR2Mr+fwBEVCqyTwzSRhc6nKLdM6
 BS/GAtuNtHGbF8Ds5ZACwF/Uxep2jLBNtrwFHE/2/7hGffpXQplP1ObO69TcZ7AWcKtlSPDXqdy
 uUqI3f7TJKPt1bM/gWs0EX7CJC5brrBCh+G5fJkYEVnymu7ryO5tMBO9agty2ySH3PjsCnQohKw
 LQsz6ZCEW+rhWawThDW6mnZV4D82gorgDOQ1KW4t7XINMZlgQdf+9GsaVPHijee/0mbM41mU0B3
 oA+qePlkayTGj90MUQeWTvaR/2aOfRoPM9XcyKC89blLDpUe8/rzTgRlMsG2O3+7i+BSExQptbR
 /kA5URMabOpuRXy9wtg==
X-Authority-Analysis: v=2.4 cv=SvAFe/O0 c=1 sm=1 tr=0 ts=6acd4e57 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Gl1wkL_h6YAIogX5mJgA:9 a=CjuIK1q_8ugA:10
 a=QEm2v4ACax8AGLlfgY8A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDA4NCBTYWx0ZWRfX+cIMAj7PzHU7
 f9A5tg122NVK5a5YnA8buDH2pb9iQVSAlDECGsVwN6AOH+La329S2rH5Hyl0p3Pp0Tn7F8tbrLF
 MSUb49egmcsCCjM9fuL6IHT2DivcpTs=
X-Proofpoint-ORIG-GUID: --woKMpnCtlCpYLlfOSnvuS4O5M852U4
X-Proofpoint-GUID: --woKMpnCtlCpYLlfOSnvuS4O5M852U4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_06,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 phishscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_141712_101321_B58D6739 
X-CRM114-Status: GOOD (  26.52  )
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

--iPLAchsNbX0Ln+SK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 10/8/26 17:31, Daniel Thompson wrote:
> > On Tue, Oct 06, 2026 at 12:46:27PM +0200, Lorenzo Bianconi wrote:
> > > Implement the offload of the tc mqprio hw queue priority in the stmmac
> > > driver. When the mqprio qdisc is configured in channel mode, the MTL =
TX
> > > scheduler is switched to strict priority, and the PSTQX/PSTC priority
> > > bitmask of each TX queue is programmed from the set of frame prioriti=
es
> > > mapped to the owning traffic class (qopt->prio_tc_map).
> > >=20
> > > The channel mode offload requires the DCB hw feature and a 1:1 TC to =
TX
> > > queue mapping, with a single queue per TC. Configurations with AVB qu=
eues
> > > are rejected, since forcing strict priority conflicts with the CBS
> > > algorithm. The CBS offload is refused while the strict-priority sched=
uler
> > > is active, and so is a channel count change that would enable an AVB
> > > queue.
> >=20
> > I don't think these CBS offload checks are necessary. It's quite reason=
able
> > to mix strict priority on low priority queues with CBS on higher
> > priority queues.
> >=20
> > In fact on the hardware I have (TC956x) the lower priority queues don't
> > implement CBS so mixing AVB and DCB queuing (whether SP or ETS) isn't
> > just reasonable, it's pretty much unavoidable when using CBS!
> >=20
> > As a concrete example of combining mqprio and CBS, the following works =
well on
> > TC956x (when I tested an older version of your patch):
> >=20
> > --- cut here ---
> > tc qdisc replace dev eth0 handle 100 parent root mqprio num_tc 4 \
> >      map  0  0  0  0  0  1  2  3  0  0  0  0  0  0  0  0 \
> >      queues 1@0 1@1 1@2 1@3 mode channel hw 1
> >=20
> > # No CBS for TxQ1 means we can't offload this (h/ware stays in SP mode)
> > tc qdisc replace dev eth0 parent 100:2 handle 102: cbs \
> >      idleslope 800000 sendslope -1700000 hicredit 494 locredit -1049 \
> >      offload 0
> >=20
> > tc qdisc replace dev eth0 parent 100:3 handle 103: cbs \
> >      idleslope 400000 sendslope -2100000 hicredit 247 locredit -1296 \
> >      offload 1
> >=20
> > tc qdisc replace dev eth0 parent 100:4 handle 104: cbs \
> >      idleslope 200000 sendslope -2300000 hicredit 124 locredit -1419 \
> >      offload 1
> > --- cut here ---
> Given your later tested-by, I assume you are looking for future possible
> improvement?
>=20
> Also it's not clear which revision you are referring to: AFAICS this
> patch is (attempting to) refusing CBS + SP since v1?!?

Hi Paolo,

I fixed the issue reported by Daniel in [0]

Regards,
Lorenzo

[0] https://lore.kernel.org/netdev/20261012-stmmac-mqprio-cbs-combo-v1-1-83=
1e323eb4ef@oss.qualcomm.com/T/#u

>=20
> /P
>=20

--iPLAchsNbX0Ln+SK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCas1OUwAKCRA6cBh0uS2t
rDrnAQDZDj5JyQxIjvG4DZeX1nnGMtdTq5WaVjVLoFhVH48/oAD/dldb+6SuuQzW
9YcrToM/mhrG6pcgFkcaqq/LD5RQ3AU=
=BvcV
-----END PGP SIGNATURE-----

--iPLAchsNbX0Ln+SK--

