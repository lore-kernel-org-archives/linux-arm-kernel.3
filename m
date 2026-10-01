Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826A6CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 07:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fcJEazZnT8uURAanK1Vp1Zd7zXkiTHBM91KnjXvtuLI=; b=Stk93PDIuFkanaa49BIijP3doX
	Cyzpfopzk7Xem8ttYk3WG4A0Bv4ZYFkJUokCEHoFlGQlXsvuqBJbM3RLxQwcD+kukWKlAHBBzADGX
	TImwjqinrRsda/IyXm0TLJhbQfFQ/pqioBftIsomiabIi0g6mBYth2J+8tK8GZyaO2Lu0ycRQN5F6
	qk2X1EZVuXFD9IA+aLa/rRxY/bh5r1ZufZ1cR3746kC59+5uCP0scBKFG0Z+r0H1pMsG/hjt1rv/o
	i955VAEJrRPQQrs51DQjpJU2eFJosKEmKp6G89xwZbk07FFevo5ymNcOa0L5IjE7+pAOldouLLImm
	mJG0YcDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBXk-000000083Vw-0O23;
	Thu, 01 Oct 2026 07:49:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBXh-000000083Uy-1i1A
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 07:49:26 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xKI72805837
	for <linux-arm-kernel@lists.infradead.org>; Thu, 1 Oct 2026 07:49:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fcJEazZnT8uURAanK1Vp1Zd7
	zXkiTHBM91KnjXvtuLI=; b=K5C3bsDlHExr54kPSs+k42C1Le03azP4hHEclWjd
	oPVQ8l4jJl0G4i05tME0aYbORdAoY/Zdz3X7IFOJ3gkymDNrQcgkzGTVKhUPKGkQ
	RIzSjZrPQGcu7xwV42gRDcB2eltkNnnD6zCd6s8etYHjo+EV07hwVzaZqVRp5xY5
	qKOmhaOT8zapXKDkYn4Or+VadKDFuqtebUsLwVqeKwgyplsi3AedJMToxoROlnHc
	DW9t9YdZTZlE22m6jiuNzjtZY+SeP6ctXmJppbhA/sZi3HnKFwkRbb06pWEHLGE1
	ySBXtUaKRge/6R13V2oQgIIALQp27IZDO9AMPfJKN9V6cw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h1hvkgcfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 07:49:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a01d1d1b6so1106469285a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Oct 2026 00:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790840963; x=1791445763; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fcJEazZnT8uURAanK1Vp1Zd7zXkiTHBM91KnjXvtuLI=;
        b=bYoOS2RnIlpiLeQArWXjl2ZiXRSlatuRSxoO1xsFbfkyoJMKW15N9bBfv9A3p8KBiy
         q0xeOAbiAKUgS8mO87LEBgLv9n3lY+nSOzCB8yW+BXUUTXAYcbL5ADGY22xyajDuF3Vx
         j+yTzKY8NShdExRzei2Q+yyA3I0bUuxtqaFSKLkmAsks2xQTyajGZrsWbFs5gDQLGIq7
         EKkCflVOd1ownv1VLvOYAxz8F/N+G9ZaAEgRtf0q2b8LE57v9/75X2k2K3WcpB79MBIL
         eKlwrkUYTDgKLnip0mCWlFN6nlMBvXqLAOuYsIwZGO1DDABzm7dN47vAO2GyJVUE09XI
         qStg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790840963; x=1791445763;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fcJEazZnT8uURAanK1Vp1Zd7zXkiTHBM91KnjXvtuLI=;
        b=gSXRnAY+Wjnv6djAoIZ+zF4/XLkX8EudzhABxigTzLhNSzcKrVE8791NHcLE9lNKT/
         oYfQ+lZ+Ey9Uu94uCPQ3Xd75BwK5IHIXx7SFVC/BhAPn91mMDPrFenC/7X5Rw3Cg0nBo
         DcHrqKh45gAnQ/Lt9EMkJPHgTazNBLXy/b4Inw1nppwLiQIXBQCiSjJ2ZuFjt08E8d3U
         pVZ/LICd9E9By8cfbI+HUHbivrBSLDxJbrunkRuY23eCCjHORY/hQKEcS0hKYy/HHek3
         kGqIP9YdZ+BaZDbs+IXNCMNVzTVD87hxIRfFQdDu/AoYTTJ0xtyXjLVReTGIzwjZb8QN
         3GrQ==
X-Forwarded-Encrypted: i=1; AKwUvBx52IXvr2QbsqyzLhwkg9fFALGJ3eRIcEMNSw5Ayn3oZm6rya2pHZJs1vhwk2o/zMm08XUxnEFnbvCica7g955L@lists.infradead.org
X-Gm-Message-State: AFuF++nicZvim1iv5Qqtq5Dfxd1jmgzbFrELfT4/skqPm7NbVHF5COGY
	sC2ms4jbZN6ll8sPnNUJeQIkQhCVJHGPuHp4hmCOSMn/6fvHls+aETVSDACNq0UKpn9/MppIhZC
	5uIWTWwT4lZmi4V6TVQae2hSu7VLnoLkFQjmJ2FHk2VC6+s7nZvRxgBb/h5xMFTr2kZjhiAb+aR
	9MSg==
X-Gm-Gg: AYBFou289//REHdS3vzJRzZdSaOwJOSJ7/TLdYJ/g37CT5lXmcPCr7JRxgkDCETcVou
	cKYU2Wthn5xgfhnpi7YrzvKaERMUt7Ogevy9hJ2wyuF2WQBW55UY3wf9GtmmWUSY5HwwOqMqabb
	42a1rPP6DOatqoeN/Iw/HO4fVVCm/hgHN+iIDhOyJsQi/wAq17oHTujpKvCrSZZq0ff7uusJNUO
	8C628R+eGW4+S7gfZdOogi6z+jjz5r8osJ/5KDaE9eDdbBQU3sl7/7T1eTGET//whHJLVKHxM9Z
	bhqACRtQ30hxObXC4mMhLmNh3H+Npsf09YxoU+rjMy8HiOQclQP1vanr82XTe2IuAm/YFV6VfxL
	6Yp+87tdQ01kIjg==
X-Received: by 2002:a05:620a:6602:b0:939:ede4:a499 with SMTP id af79cd13be357-93ca94f6634mr719060885a.5.1790840962921;
        Thu, 01 Oct 2026 00:49:22 -0700 (PDT)
X-Received: by 2002:a05:620a:6602:b0:939:ede4:a499 with SMTP id af79cd13be357-93ca94f6634mr719054085a.5.1790840962161;
        Thu, 01 Oct 2026 00:49:22 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48b068ff95esm4416843f8f.12.2026.10.01.00.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 00:49:20 -0700 (PDT)
Date: Thu, 1 Oct 2026 09:49:20 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Stanislav Fomichev <sdf@fomichev.me>,
        Jose Abreu <Jose.Abreu@synopsys.com>,
        Russell King <linux@armlinux.org.uk>,
        Eric Dumazet <edumazet@google.com>,
        "David S. Miller" <davem@davemloft.net>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Serge Semin <fancer.lancer@gmail.com>, Simon Horman <horms@kernel.org>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Richard Cochran <richardcochran@gmail.com>,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        bpf@vger.kernel.org, Rayagond Kokatanur <rayagond@vayavyalabs.com>
Subject: Re: [PATCH net-next v4 0/4] net: stmmac: preserve and restore the
 installed EST schedule
Message-ID: <ar4QgHsclh1vWVHk@lore-desk>
References: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5O14Dw0334SoMGBW"
Content-Disposition: inline
In-Reply-To: <20260930-stmmac-est-reapply-after-open-v4-0-9d4366587b73@gmail.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfXx47f7jjeSmTD
 /SqEvy4O1gm4CPQlyYwGZIUyOd3x+wS9IUBqYy2vVuc4XF1J11106tcOkF9PXyDdmzcedBCqkOa
 cSFcrlRpNE4O/K9HPaIfyayIIMZZCwU=
X-Proofpoint-ORIG-GUID: IkoslSDSR_ETfbKlD-PdkGgMfpzqr17Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzMSBTYWx0ZWRfX0wS7TWoyBVBN
 Zzo2BXYmhqAq3bJ5JYmzWJXHWFlAAR7+RmSiHfKvhBCdnzWwrmns1kZVgN+p1dNxbhkT6i8OcWQ
 IZrxH7R4D/WUgditQR6ao0BH9NQc0uMtK5SsWBsPd+fztCW7k0C3JWRUU/C0XIinNQIKokJxdIn
 pOQIZT1k5tK2ChBbxMEF7NcKnM+/r8Zx4Ns05qvtNG9E21cDqf97aT40NAiMwqea5XUjDnGCpt8
 ef5XvX24ZxDxAx2sAYkwXcFIgn/+lE4MY+6RFVKKfSRG8+MdA9GxYTr9v+X/adynqgqFradrX9+
 QHc7ycbvjRjIhUTj7pheHowtQ24Wh1l2VwD+8SPGfCvTmetB3xJPrYsLUZThc29uR4Wvp5z7YEV
 Y8d4pwWnh/RbbnkZRa3rLjQvvldBWuh5quONQtWM+ZRL0X4jEu+L1IVnBCZjCZnekG7d1zozu6W
 tz51/zgX/kTg31nVrqw==
X-Authority-Analysis: v=2.4 cv=IY8Symqa c=1 sm=1 tr=0 ts=6abe1084 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=NEAV23lmAAAA:8 a=pGLkceISAAAA:8 a=vIXCTXOdsuUdJ7saXm0A:9
 a=CjuIK1q_8ugA:10 a=6N3VuSNxPG3FNRDMqtEA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: IkoslSDSR_ETfbKlD-PdkGgMfpzqr17Z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_004925_454795_6BE14E78 
X-CRM114-Status: GOOD (  25.39  )
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

--5O14Dw0334SoMGBW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Continue Lorenzo Bianconi's EST replay series with v4 of the unmerged wor=
k:
> https://lore.kernel.org/r/20260902-stmmac-est-reapply-after-open-v3-0-e72=
a6df5a7ef@oss.qualcomm.com

Hi James,

My plan is to continue working on this series (the code is available in [0]=
),
I am just waiting other patches to be merged upstream before reposting in o=
rder
to avoid any conflict. I guess it is correct to publicly ask before posting
other people patches.
Moreover, this is thecnically a fix so this seires should targed net tree.

Regards,
Lorenzo

[0] https://github.com/LorenzoBianconi/net-next/tree/b4/stmmac-est-reapply-=
after-open

>=20
> The PTP initialization fix from that series is already in the base.
> Carry the remaining embedded-state and explicit-enable preparations,
> and restore the installed schedule after open and resume reset.
>=20
> Build TAPRIO replacements separately so rejected updates cannot
> corrupt the installed schedule. Rebase the previous schedule against
> the current PHC when rolling back a failed hardware update, and keep
> DMA stopped until replay succeeds. These changes do not depend on
> the later datapath recovery series.
>=20
> Changes in v4:
> - Omit the merged PTP initialization patch and adapt the remaining
>   changes to probe-time PTP locking and current TAPRIO error handling.
> - Separate schedule validation/rollback from open and resume replay.
> - Reuse the base-time helper for replacement, PHC adjustment and
>   rollback; propagate errors while preserving the installed cache.
> - Start DMA only after the installed schedule has been restored.
> - Link to v3: https://lore.kernel.org/r/20260902-stmmac-est-reapply-after=
-open-v3-0-e72a6df5a7ef@oss.qualcomm.com
>=20
> Changes in v3:
> - Guard priv->est.enable update using est_lock mutex.
> - Embed stmmac_est in stmmac_priv struct.
> - Rework locking in tc_taprio_configure().
> - Fix possible divided by zero crash in tc_taprio_configure().
> - Add missing reconfiguration during stmmac_resume().
> - Honor ptp error code in __stmmac_open() and stmmac_resume().
> - Link to v2: https://lore.kernel.org/r/20260829-stmmac-est-reapply-after=
-open-v2-1-5e5ccb185e92@oss.qualcomm.com
>=20
> Changes in v2:
> - Rename stmmac_est_reconfigure() in stmmac_setup_est().
> - Rely on stmmac_setup_est() in tc_taprio_configure().
> - Link to v1: https://lore.kernel.org/r/20260825-stmmac-est-reapply-after=
-open-v1-1-dfa80735e0a1@oss.qualcomm.com
>=20
> Assisted-by: Codex:gpt-6-astra
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
>=20
> ---
> James Hilliard (1):
>       net: stmmac: preserve the installed EST schedule on errors
>=20
> Lorenzo Bianconi (3):
>       net: stmmac: embed struct stmmac_est in stmmac_priv struct
>       net: stmmac: pass the desired EST enable state to est_configure()
>       net: stmmac: restore EST before starting DMA on open and resume
>=20
>  drivers/net/ethernet/stmicro/stmmac/hwif.h        |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h      |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_est.c  |  47 ++++++-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_est.h  |  13 ++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c |  38 ++++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c  |  59 ++++-----
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c   | 142 +++++++++++-----=
------
>  7 files changed, 176 insertions(+), 127 deletions(-)
> ---
> base-commit: 1631d79ae57dce2c5f88ad278307028638a8b4d9
> change-id: 20260824-stmmac-est-reapply-after-open-181d70a15eb6
>=20
> Best regards,
> -- =20
> James Hilliard <james.hilliard1@gmail.com>
>=20

--5O14Dw0334SoMGBW
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCar4QgAAKCRA6cBh0uS2t
rHudAQDRHrkhhNLiQEOGozztlHRmh86K2cUt6Z+4yLFiMw0PWwEA8XYf7p64JJYb
H5S88bWzi8YBwiXw36fKmolphF5lWAk=
=R8Ou
-----END PGP SIGNATURE-----

--5O14Dw0334SoMGBW--

