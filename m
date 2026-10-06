Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABAFDCA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 10:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bTcOZk1sU7Cr4tIN5dvWZPdb1cIAJQKKZzgNOboyWAo=; b=0l3o9wr3nDgQqbAmGRyCOURjZH
	9oZR8JfJYeQnz8yh3WpueafTQ1+8wzheUI5cHM4IRAisFwUm8VUP+F8K3w50e3yAs+8yo4zV/uE+P
	s8u2JEWWyWUkJZVkBXK1C4n3CwsZ9Ko9CxspoOOWO72e5ltn1OlF0IMKuUPBU0XGrUIkxV1zk6xQl
	6QgJf0MRUYHEEgZ3nklNroQ6vwgNx6UUsE1oVkheYMc62DKipBcP3q+IQXwPcbyQW7V2hvKo+OYVM
	4M+ZYxL1OWFJ1dQAjvYGCrq8UMD2pt3TFrFcl+CCSpsVBBi9hUOv8i8Zct9ZLL1uIF7xMdETtU2wL
	+VykaB5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE29I-00000000SlD-2N3S;
	Tue, 06 Oct 2026 10:11:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE29G-00000000Sko-02WU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 10:11:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696A59Ko871148
	for <linux-arm-kernel@lists.infradead.org>; Tue, 6 Oct 2026 10:11:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=bTcOZk1sU7Cr4tIN5dvWZPdb
	1cIAJQKKZzgNOboyWAo=; b=WxY7EEItgMWleFNAVpaHwfH1Fh2UnXDdOV7xRlmQ
	0ghdSu2SroEpDe4ZYh/4b1Frsm0M4DL5w+8bEThCgcbQMJvnCeZNUslpMm5ze/Gs
	L6yUvvUlMA7MwiQP14ONQwdNMBmOtPpUvXySpmQkZbiFESW+cG1h7BJEuOCHmQbJ
	66dGVSqBMjhXaURmiGqwYzXghlMVQkhBSHwELk7iW+KOZcwyWy/i2sd7o2qFI/3O
	u3iFftSATRIWXWFLliY43aj1UzFT47O3J7jXTmO6ifG15Cf3aZitv2Tfs1lQ8m4o
	yN1q2IsWuvr+9htUHFB0t/5F1r/02nXEotw/7pUSWdWk0w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbg4j8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 10:11:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93a1de6d5c3so567121185a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Oct 2026 03:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791281508; x=1791886308; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bTcOZk1sU7Cr4tIN5dvWZPdb1cIAJQKKZzgNOboyWAo=;
        b=cXCtjWQzMdpOU8oeqIK/iRimCgbxOlyyDDU4bDz7XUiqzb61SPg75hJOvcTkhGhB+5
         FPA5SQ6cZHwfQWjutF4IcQS38mvzsNrRma09NCRrITiir/f1QZ6YOLyCd1K5zrcNGPNn
         qb8j5kyn2HXOfnvB/dgmLc1TO2i9aFhDu/H+Xm7UWaKdjFq45Ui5Xy1XUZJx33J8cLLL
         dhPBkfKd6EIBdhM9SaZXPqpgy8PNbQA27K3OnEgMIPR564+QvzPB4KHTSc2j0RJTZfxN
         n5skkoWA+/4xC1WcSkO1kf9WWy5102ds73gReEli/8xM2xgcaXEH76wUVoVOqH6qLnKd
         22yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791281508; x=1791886308;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bTcOZk1sU7Cr4tIN5dvWZPdb1cIAJQKKZzgNOboyWAo=;
        b=Qk3mcZ5C+DKfmhfmb0pezjnfCVztxfofnGTGkL81bCp5dUynfptpKg/GUo9hCilJbG
         tSYfkhLlLkxe35MvaWrcLwmQ1byJS5NOvP6Yuc9cQ6DwJwO7GRreurouANzkJee8esRe
         rI24HTpNO1ZovoII2Qlwk76M+10mt5upTWiDQPjDW3y1FK5QglX+bXqzPsb9p0g69gy3
         TBB0adnYeZJXzBqpfJPEvmvgqaXJji7bAxo5wBaLwHuREsaPQ2TRz7cEwOBDmlImM6sV
         zx31pBFGZ62YzvzRsHgGUNKpBzSeASlLNFP4JsbUmxMbsW1cfKXIKI0iLLEAkj/I8mMm
         /Bmg==
X-Forwarded-Encrypted: i=1; AKwUvBylXiRZg5XhqKEsi1vcQJRbp5saEK3Kw8VgqAwin3OuF5ly4mEUxWHt10TSTzKib86IVo48vna5KzR/5pbhNja0@lists.infradead.org
X-Gm-Message-State: AFuF++kHD7o2TVat7osYcyr+CuW70suPwd/PZfesYQm44/pc5aG/FELS
	ojTCLaGmBiilNIFmj3b8eY5Jrwz3pgsSnB2Kze9WOuz7UijMsdXYX3ryk+KRZ1I1qgiyn4yRpfV
	hTOqoKL/aXCw576eswuWX0oYvdSl8KWBvPlYHdyB6u3IhPhEMaMWEMSPNJpAFQQBMwizsaJ0cj0
	1Hzg==
X-Gm-Gg: AYBFou0GX2Um/WkdxnJXkahWlOzYsJ5EPt6vf0neJ+MMEvvGfM45/i5IuG4LWhOp3mb
	Qd6Xr/3JYTz8vSgK5zIJb3r020cO24EgiPvUw7XPjwOUj1W5ic0BgHSJEUD2Kh6Z7emPVsQDpkh
	iQ1kTn5bfR6A0bqsJQ+5G9Wf9yRaS6/56OetTomTr4LwtE4sDJ207fr18naEQVg0a7MwYksJdUS
	8KhLMr73xkR58pR9f7TGSRIdIKYU9vQZqS8d+nPA3vn9RLUszZXfYU54q7M5JTXxPJWIhmek8Pc
	G6M2W+q4yJYo4lg/0nGV5hTX6mpnkBQxrLTEho4xXKtlcmnLEyt2HPbpabJeqGIc82KXjq+2uuO
	G2Sj1F2THw0EjVw==
X-Received: by 2002:a05:620a:25d0:b0:93c:c96c:a5a8 with SMTP id af79cd13be357-93e8f4ff7bbmr151196285a.53.1791281508238;
        Tue, 06 Oct 2026 03:11:48 -0700 (PDT)
X-Received: by 2002:a05:620a:25d0:b0:93c:c96c:a5a8 with SMTP id af79cd13be357-93e8f4ff7bbmr151191185a.53.1791281507645;
        Tue, 06 Oct 2026 03:11:47 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1776cfe45sm64306225e9.1.2026.10.06.03.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 03:11:46 -0700 (PDT)
Date: Tue, 6 Oct 2026 12:11:46 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Oltean <olteanv@gmail.com>, Furong Xu <0x1207@gmail.com>
Cc: Daniel Thompson <daniel@riscstar.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Davide Caratti <dcaratti@redhat.com>
Subject: Re: [PATCH net-next v4 0/3] net: stmmac: Introduce hw queue priority
 offload
Message-ID: <asTJYbO3a9EC0KhX@lore-desk>
References: <20261001-stmmac-mqprio-prio-offload-v4-0-a74610d7f1e5@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="udmTCzUCSWgTpXTE"
Content-Disposition: inline
In-Reply-To: <20261001-stmmac-mqprio-prio-offload-v4-0-a74610d7f1e5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac4c964 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=dNSR6zmZCi-5ndhixXcA:9 a=CjuIK1q_8ugA:10
 a=hyajzLvZGwCchFMiHN0A:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: LqXaaMuPTjNet9uF1m3iHpn_iXc5YgUw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA0MCBTYWx0ZWRfX2u8mXvWNteuE
 fMm59AZ85RpKY3sI9GTBliFvk7JY9pT/0v3E+2cqHRq38EsPpDZlNYdln+oBEiBEXX9o/siZkO6
 6Bw3C7BvbhjkLWW7o24z5UNKT1Qbz24=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA0MCBTYWx0ZWRfX2wtcHTAaP0rE
 LuIHlwUhtYzUskCocJBDMPzL7HIr8cHhpod6EO8MOH+P7YYH42EhR4QCqhnFzHhNX29vSetTlik
 rgjHPXabBZlK9/HTS8Tbr3zrhSMz319G+qbJ0/VuFyFnMWE61wNh44Gemb2MGA6GXfSuK2os7hp
 uN2JRgw+6yZ+wDkNsj3PovU/CCPJGhts9kC8sPpLm6PQJVk12ycuHBEZiM7LEN7EEX2knVd02xq
 /RWebXAvLv/dgP0aL1AqxFA+bZMuyz/wjqXBTEzF8CtutO4bs6TPGNXTRfhyyvriHDEGIY9wC5N
 3GrkL35LVDOJDnhukneuly0Aqv8yKgyj2S6W7CxWTiw0jxe8X0qocXl7qY43SOEqQ0qhR1jQer0
 jhLQyJCnEYotyN/hGj55XDJpv1CdhlaBNJcz/cU0bcoseyakKUrzHJWAVstkQY8X9R2NkO+ia17
 to1JgdRsp4iu/1g90FA==
X-Proofpoint-ORIG-GUID: LqXaaMuPTjNet9uF1m3iHpn_iXc5YgUw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_03,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261006_031150_188408_27859BDD 
X-CRM114-Status: GOOD (  23.46  )
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

--udmTCzUCSWgTpXTE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Implement the offload of the tc mqprio hw queue priority in the stmmac
> driver. This feature requires the mqprio to be configured in channel
> mode.
> Do not overwrite real_num_tx_queues configured by the qdisc in
> stmmac_hw_setup().
>=20
> The misbehaviour has been reported by Shashank and the patch has been
> tested on a Qualcomm RB3-Gen2 board.
>=20
> ---
> Changes in v4:
> - Move real_num_tx_queues fix before mqprio offload patch in order to
>   allow easy backporting.
> - Add patch 'net: stmmac: set real_num_tx_queues from max(offset +
>   count)' to fix the real_num_tx_queues configuration.
> - Link to v3: https://lore.kernel.org/r/20260928-stmmac-mqprio-prio-offlo=
ad-v3-0-abbe181f5024@oss.qualcomm.com
>=20
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
>=20
> ---
> Lorenzo Bianconi (3):
>       net: stmmac: set real_num_tx_queues to max(offset + count)
>       net: stmmac: align real_num_tx_queues to mqprio configuration
>       net: stmmac: add tc mqprio hw queue priority offload

I will fix sashiko's reported issues in v5.

Regards,
Lorenzo

>=20
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   9 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_fpe.c  |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  37 ++++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 147 ++++++++++++++++=
++++--
>  4 files changed, 172 insertions(+), 23 deletions(-)
> ---
> base-commit: eb0c18404c8943356f4aa164e5db9067b79ea93c
> change-id: 20260918-stmmac-mqprio-prio-offload-3d82d87f7bc8
>=20
> Best regards,
> --=20
> Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
>=20

--udmTCzUCSWgTpXTE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCasTJYgAKCRA6cBh0uS2t
rIc+AP9evodgsgIwTTdGv/RgmpB3B0Xw1hzg2HAD0UDXltWaTwD/QVaIF5p9o94I
wPNDQCHFkUU8YXnSMZcx8ssRKfDLkA4=
=NQSM
-----END PGP SIGNATURE-----

--udmTCzUCSWgTpXTE--

