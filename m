Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124A4CA5FD2
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 13:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFDrY6jJae9sQwA/g3w+iQrtIzp0EFP/zxY0CoXTnCI=; b=x3+wS0MD56cN5ZPM+DbOa+T7rb
	teqLk2RhZicmhS2/V7CZZqaiDlaO9iQHn1ehx4kpFwvTBf+3vVLnpw1C9At2NRrWM0HB0uPTuBShi
	IZFcKo8ikRGeUYEEKR9G6kjx6pOZpABYZEj+5s6/NIxoeeI5QZayNtwK/sWqoMPmhOgYSVmxaVAC3
	lrStMsHQEfD7pYrFFC0G5p5z+L3zf/NnFqM1HjQitzHRKAOlBrDdGwX8As6RD2fRHK7MXFrl+VfZs
	9TTpS09ypx0TWu1gABIpgbS7jauRd3ZZ4yp7fBDdn0ooTA0PhQWimQTsSBkjOLGx4DxZI66eU2pxX
	53YRh+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHDs-00000009HyS-2i94;
	Thu, 01 Oct 2026 13:53:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCHDp-00000009Hy4-3ZXu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 13:53:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 691DijmB3776319
	for <linux-arm-kernel@lists.infradead.org>; Thu, 1 Oct 2026 13:53:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OFDrY6jJae9sQwA/g3w+iQrt
	Izp0EFP/zxY0CoXTnCI=; b=bpp8giiUnK4uLsq6baRkCaK0oAqKx8JpJWoUzFCq
	oR/aRp2lcOKpy2LKgjB3ELJBHdlHgiVQvDYaQEtha9CcLcbst0+rzdN0T/QqpddL
	diTXXMK7mRp/C/w/meg5cQoZklX5IoF6k2citY3xg7rlVIT4OXznbCqCXFtq8s5V
	VzZ88BSR5WZub9EP1BPXj2Wqb3dgJKjl0IVnmAkz/7cF9yuOv0jePA/pxr/709DX
	O7DW2jf/g2Gs9AlfAjaBOrvfpatao0IOD7jEPWeFzvvVIaKn/agVIMpnhMAh1MxI
	Ei+BZLZPupa12MLnQ4vAqUI/Y/z7cxUJIJo1Jh3nva99xQ==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1p2b8qam-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 13:53:17 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7b2f700b30bso1412206137.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 06:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790862796; x=1791467596; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OFDrY6jJae9sQwA/g3w+iQrtIzp0EFP/zxY0CoXTnCI=;
        b=C/YkZiELC7hau+/eIG9KblXqEk52ikWf5rowX4u0jX6oSIZNz9kqNeG6wV68rJ8Mf3
         QkcZJrSqvFBuWvcir4r53KC14aLNmmDdnm/ZcruF4ydBh0MOT60WVacL96TK4Z3hrF7T
         ShSru5zDvTXqOsZlDgD/oYFbvUKG+jwcItRhzIVqcGU32tVuxy1LbUU7nXpQGJXafP5I
         r8leH8SPM/4u+YHLvX77MKSQp/dZtd8Loq56U083k9MJTacfSlw3ydi2s1vslsU1z0K5
         mhEKdmpUsInSs89I0Rd7n1GP4ktUQ7r7oWJGR99l5ejQvwHra2FrhdN1StGNOsgrAHRA
         EtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790862796; x=1791467596;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OFDrY6jJae9sQwA/g3w+iQrtIzp0EFP/zxY0CoXTnCI=;
        b=o+7ouVOxzJ2XLc4zqH0ilo54OPoRhIYBCq2EEoncb5MpEJufzaP26ixyvWec5j4TWL
         1BgSCL9ouJ2d3vaLQfJp70qlaMaDUlLq6mkDZdxNgbB2VYbE1tHuzaO25nCwmmhfMsA5
         Za7imBoI9bfHWdm/Zrk44hJ3x2zTLuaNOvmAo5jL9YqB52C0JsMUU85oy3vbGCR0B2Oo
         cK/aFbLeQrQmR3ILT2yItLKnI7jViRtxqjTnpemZUf3Qoy8tsMMQteGWB5+kKIXamC1Q
         1GtDm988c2A2NFFRco2jN5tMlkrGHflk7X22rNYAzhTbbigoF5eOEuH9N6BxLYmb3b24
         doAg==
X-Forwarded-Encrypted: i=1; AKwUvByVaIVWg9fDwidbA+Gk95eTEvVuX1eXX+t1VYm4N5AQXZG8CoF8aEXvfoDXQx9emN1BZQ1FySaaTEWiKRnaHE0W@lists.infradead.org
X-Gm-Message-State: AFq9FYINFZ2zlGdJ3h9U3LKmKi/542wByAgC6QhTLV9MA3sYFfVisELG
	AnBRn+Oj/x7r3OmxFySTlOgQsaYCe4O9c7Ht+2vjhcoQMfnow2Gvz64PIDkXnfhQsRcLWPPae5N
	hlEWfLxTcsHVCR8D8oLIQiEfSXJPOis7+AklaOyQF805C+urEdhfWkK5RlXPMNvK0Zb9B7HcELF
	GH3g==
X-Gm-Gg: AYBFou16QKGYun/AIMSaNBCsQy4m26miGQb//kGQv+N9ZNn3KoApSGal5g6G44VwMoc
	SPHCM/RFjozBb7oOfzENIrYBp/9K7QQQ+goh6N4FWtBSMP09OH8cjDyW1lHx6sBGCa2XkuYft8k
	IYNhAH43xYX2TEhfDTvZR3ue5nkP3xrSJQSZMkuB8XhAuLXoqhpi+CGe0Y69Jabbrww6tRP5sUf
	7oY9x16XKadQcict1og7/MTGBias/fCCA70dTlGPIulNIN4iqK4N15E9SfqTIoxSVUpEv8BBWOj
	sy3JiAFOQY1GziD/nNAea2qk4wiSa8+N9MeYKdTMqhwgkQnkqZMDZYKUZcGqNcO22IY4xWpa1tq
	Y3aRDZeO0CEjmzg==
X-Received: by 2002:a05:6102:2b84:b0:7b2:f790:c028 with SMTP id ada2fe7eead31-7be73a8dd26mr1146115137.25.1790862795992;
        Thu, 01 Oct 2026 06:53:15 -0700 (PDT)
X-Received: by 2002:a05:6102:2b84:b0:7b2:f790:c028 with SMTP id ada2fe7eead31-7be73a8dd26mr1146103137.25.1790862795417;
        Thu, 01 Oct 2026 06:53:15 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b0690d284sm6096797f8f.17.2026.10.01.06.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 06:53:13 -0700 (PDT)
Date: Thu, 1 Oct 2026 15:53:12 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v3 0/2] net: stmmac: Introduce hw queue priority
 offload
Message-ID: <ar5lyAFx3H7Z5McI@lore-desk>
References: <20260928-stmmac-mqprio-prio-offload-v3-0-abbe181f5024@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oVNdUR3qC5DoPBrS"
Content-Disposition: inline
In-Reply-To: <20260928-stmmac-mqprio-prio-offload-v3-0-abbe181f5024@oss.qualcomm.com>
X-Proofpoint-GUID: FkH5B_rT5ClI-qKOkr_lBxb3AnYpRWD-
X-Proofpoint-ORIG-GUID: FkH5B_rT5ClI-qKOkr_lBxb3AnYpRWD-
X-Authority-Analysis: v=2.4 cv=O8SsLx9W c=1 sm=1 tr=0 ts=6abe65cd cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=n-0y5aq-Uey8P2rTCuMA:9 a=CjuIK1q_8ugA:10
 a=TfBcX7fOkBFiNxCBcSgA:9 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfX7XYxQqAVzfqy
 5C6ORZxTCWwvl56SiIFLLFgeKiolW2bjjUZf8r8MDflELPHtxmK3Ez+UClbvG7vIHkrrOPQ/hw3
 9tVmh/uZnThW62ZIcUNUYJyGLd+g1Cw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDA1NSBTYWx0ZWRfX/luq1aRrXXmP
 gASKVt7yPsHUqa5bF2/7mk++Oyk4ho+SHJOPrqYNmEq7oxC82HqklTPO63NBzsqJOGdsKL5n3fm
 o25qrQ8l6Tu7ZsSHJoKiHdwCoVIIfBZD2pxmyWC5sGvQZB556FaWpVmWSbDFDOL5aSKADrjb6Wr
 4nDxjSswogBmv9Gr7xFu9voPofOAq0OcXyt/K9ZFYXZq0+x0lQtS3EHk8ClDUyZmhHjwkTAT8S8
 DUVGhAUkfaunqF8u+5vq1o2TAv+udTl5NY1b+mjiSTGDl1eInQ/t6tZZOxmaIhZE1RbaRj7m6j7
 j+KcS+aEegwAgybg9zCST6QKFPod7e64g2iXNzIBV1D65jL2k0MWc6W24YoVKWj99dg+tihAA5R
 Xya3fsJMpZa5zgL6Wg0j5PCcHIeP9gP50PtePmar9IUqUadTCTvuPAzE6VWqLkw9/EnLB4xqhOj
 YOSRQMnEJZCxUciV2QQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0
 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010055
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_065318_024890_922480A8 
X-CRM114-Status: GOOD (  20.80  )
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

--oVNdUR3qC5DoPBrS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Implement the offload of the tc mqprio hw queue priority in the stmmac
> driver. This feature requires the mqprio to be configured in channel
> mode.
> Do not overwrite real_num_tx_queues configured by the qdisc in
> stmmac_hw_setup().
>=20
> ---
> Changes in v3:
> - Fix cbs overwriting removing mqprio qdisc configured in dcb mode.
> - Return an error in stmmac_reinit_queues() if configured number of tx
>   queues is lower than xmit_qdisc.num_tx_queues and mqprio offloading is
>   enabled.
> - Link to v2: https://lore.kernel.org/r/20260924-stmmac-mqprio-prio-offlo=
ad-v2-0-fdd8b69efccf@oss.qualcomm.com
>=20
> Changes in v2:
> - Forbid cbs queue offload if mqprio is already enabled.
> - SP requires 1:1 TC to TXQ map.
> - Fix the real_num_tx_queue overwrite during device open.
> - Require the qdisc to be configured in channel mode to enable hw queue
>   priority offload in order to not introduce any regression in the
>   previous driver behaviour.
> - Link to v1: https://lore.kernel.org/r/20260918-stmmac-mqprio-prio-offlo=
ad-v1-1-5328157fcb58@oss.qualcomm.com

I will address sashiko's comment in v4.

Regards,
Lorenzo

>=20
> ---
> Lorenzo Bianconi (2):
>       net: stmmac: add tc mqprio hw queue priority offload
>       net: stmmac: align real_num_tx_queues to mqprio configuration
>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   9 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  37 ++++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 144 ++++++++++++++++=
++++--
>  4 files changed, 169 insertions(+), 23 deletions(-)
> ---
> base-commit: 014d795c73837ea2339a4ea8e8f82c6e959b845d
> change-id: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--oVNdUR3qC5DoPBrS
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCar5lyAAKCRA6cBh0uS2t
rFoYAPwIof3Ii6CtUjrRrswysbsJ6mXCQG3Qm6KMH59m8VQIswEAtY/GVTsy0GxB
UK5hZzSmyHk71qhui2ggdZrfK5RAnQ8=
=vuXL
-----END PGP SIGNATURE-----

--oVNdUR3qC5DoPBrS--

