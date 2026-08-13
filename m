Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9874DC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 20:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ScWLcB/fMLJOTJ43EoCi0hMqy36OYwu47ooR2PxtXT8=; b=asVovaGZUO0b8M/BzKtjp9zB41
	I+mrgWkRs6v8z6GYtP0YacRCUu5QmWyOJnXjeEftI8QQTg56GtLtcLf9hch8r8aEuSxoaWGaAbm61
	lVfZEBhmvzfj4LvYZNx5OsPoSqVenlD44FVsMqE9fuaJDyHLJNAV6fiYPkhEVj49QAwGfZ5aSeUOZ
	N/aaAR0oJ96r+8FnlehgKW++wqwXR306hEz4UUjW8UCmnae//6cZpWZpgE+s3tvU8fDC/py97AN7T
	59iKSs5lDm2HIZEVpEs5L72P63obWfjLV8gMZ1lEQowrS/78gTl4P0ZQZsLPuXKHeWOvsgkrwmUa4
	MjT+50XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucAI-00000001W6A-1QLt;
	Thu, 13 Aug 2026 20:36:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wucAF-00000001W5o-2tYM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 20:36:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67DIhON32370935
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 20:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=ScWLcB/fMLJOTJ43EoCi0hMq
	y36OYwu47ooR2PxtXT8=; b=UF7qj7o1JQ8xcn4DuuBDxxrMmkIMr/CwqceJPZ/e
	jKs5S7f1thRenz+oyRIpoQplLg8yUAk+yLP4lG2GSAQaen1ZXBdbYtbVaRXSMoIT
	EvDBIu8QTcEi7WNVzdGTzEEXzYOW25FF/aacNqjkB+h78L5xPsu0cqUM5NOJYMGN
	ZwHR1gNbhhbNNLcMDVr01jNSFnnSioj4iEiBoORCUb8OpNnZccCaBKqYRyOELCbe
	/7wemTebMw3O3O/1KVOc07gJT9Gdu0zcwcilJN1g1yiPWNvydcwyjbVYcqRoaJ/O
	ZIdcymJKTwhz0Q8DC4OQmjM/2Szovdhs+zt0t654GI550A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1hgy129y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 20:36:33 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2cce14a21faso3271035ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Aug 2026 13:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786653393; x=1787258193; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ScWLcB/fMLJOTJ43EoCi0hMqy36OYwu47ooR2PxtXT8=;
        b=PL6fE9yu0Qzua5Evfr8jxZ5BajBojEZr0NSXKXb5NxTAaWvXG98qErrc/acnK6HnRC
         lIceV9RaG0WYmPZYvELAw0RRJK+JL+L1+T08uCLBuKdpIPgyg70DIqqAxLqoreh7GY+W
         tuX8AXhfSWRDeOy5xgokFY8gxYj+skoOUWbPAP2KbzaIcG1Sf6JLpjyD+qKrNJgu8iJw
         T4SVuXfzl7dnfJC43FnqF9TpUjIGRCEhHgSQzKRNCCsRUTO5ax2aUFfuwpYSx2znL8yv
         VW2lBsfruoXhK0rY8DMp/MWPvGzLviP726JPzFk90V++lr61IonQhzkPIUyDgDoX1cCq
         RYkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786653393; x=1787258193;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ScWLcB/fMLJOTJ43EoCi0hMqy36OYwu47ooR2PxtXT8=;
        b=X7zRb4BOyzl6sFUoaC3z0eEuRJR1InJ2smeZUPrOjF3Puc6hWByq1U/ViqbBVEAztU
         589nHQXbXgD9Ksvg5g2jOgkyjBdPHqko8QjgJTuoK93fZ/K7NQbxUO6Qey7xFjfRrLLj
         tBegGlN3WRlZqvI1w69MRC/NJI263/TQMX7Im8ZSxMIDA/WW6/6gwDI/NIyO/oy2AgbR
         2AjzqyTWHtAoJR4pNWBVUvJUFi70U+Fhuub1rdv6K/mXYI4r/96YoX34ALE//0QwZrLr
         Dft4I2jhQn45Ue1ulL5M9oanN96JCYMax8Pl41gFoEf7t1Ll8RBAJMSvM+EGPGULBwMW
         h1kA==
X-Forwarded-Encrypted: i=1; AHgh+RrAojLp1ZtD8Zpy3X+ovKDExjaYpaAbVXDZADlD2Gv0JeJvQIfLZGTrJQBZCCPoO95PL2Tze52kDa39k3jrocsZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyUNgnOb71zqZJB1UBzVqRSW4ShnO0CLmg7P0S5dHRw6Vnwt4ji
	8XPrU/yTvPTt+UD8QXeiA0oSi3y+Ve9mi6chAAPnAnWfKmtF5os6GQxKgrXck3dM43zTNw7zI7i
	JrqX9xRXd6/LqvuVe5qGUwPOJ6CfKj9ad8uD8NUZM3ozy43MqHs8m6jP7kgorC5LxyLOAwmzYSH
	J/Kg==
X-Gm-Gg: AR+sD11H7KDlmMjiC7/gMm2X5V32H1vEUzTwBV/XUU9O+K4F7fMe4mnA6OK6Bg7iuqr
	NMWYyL7hnEyj+dUmeXY8JVjGzBdJF2nrP59HzJe8TtKtora04D5ygfFA1pKm+TjWvc5BytSErbW
	XsE1m/yJqw1AmB/fOrMjiA9SsNuJHDVkAAeJTDFgtMrpUX6luXsngkHUBYU3QDPRg/MsXMxE9pH
	xVI7PU8p9++5HUt1WQmMdAnDKol/HnL60m1PPQ0qw9Gdz14m9knHiA9acL3AfYHxKesxkPsjBs+
	0vayCVXwfRmhPZdrE2mfSQdQTyZX/sjFkxq7IEEj6EfFYDXrrO4/KSHDJYbMPw4/7pICeZO79GB
	dgitAEkq9fTFh6w==
X-Received: by 2002:a17:903:18b:b0:2c9:d8c5:d55d with SMTP id d9443c01a7336-2d3b00300b2mr5126105ad.16.1786653392611;
        Thu, 13 Aug 2026 13:36:32 -0700 (PDT)
X-Received: by 2002:a17:903:18b:b0:2c9:d8c5:d55d with SMTP id d9443c01a7336-2d3b00300b2mr5125635ad.16.1786653392076;
        Thu, 13 Aug 2026 13:36:32 -0700 (PDT)
Received: from localhost ([4.43.230.125])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d3aeb2e34fsm1884765ad.48.2026.08.13.13.36.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 13:36:31 -0700 (PDT)
Date: Thu, 13 Aug 2026 22:36:29 +0200
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
Message-ID: <an4qzUrK62-rN7Q6@lore-qca>
References: <20260808-stmmac_select_queue-tso-fix-v2-1-67175b29772e@oss.qualcomm.com>
 <anybM_3Rdg8X8CMs@lore-qca>
 <20260812161038.5602eac9@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zjnd5hJChYYzsEVt"
Content-Disposition: inline
In-Reply-To: <20260812161038.5602eac9@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDE1MCBTYWx0ZWRfX3YWby7LJNr+J
 9r94F67+cXVRbvcCiDpCyT69acYd8iXpO7aGpuX4QclQ3hqh0IG6k0e/ANQBPSdqOVF49rLxyXf
 rvbCu7XUV/10KMZL1yC1xQUaxX903KdR1NckeOW+kJ1gg7vxy8NMiHUlA5wdou8LSaG0ISxycs0
 9voS2SpRQptH7XL663dGkaER5hFWSHCcvchJlNpUKJNzd3hVgh7mS8swcmpyXsj4f+HGtgC9Ofz
 onQyTNGXNwi+Qs5xA6gJRfO0XHfAD29ikO9L0xljsKMaUWjPABXTdgWYv82kuNh8c5qYPJCPuvh
 YxjS0sbJMicQK2nCfgP30KX5Ic4ar0D+C/n4LIXyjqWrWMhvO4IgmXiQ81cicM9zl/xCkX8ji3Q
 TKYqMmqBqYN1GT8v6hOg1iH8eEnyhocMAXMkW/E/zHyiY+lDusfgdXX3oBw/R0j7CovpisnDI4R
 7Cjeb+VT3olEvyH41bg==
X-Authority-Analysis: v=2.4 cv=AaSB2XXG c=1 sm=1 tr=0 ts=6a7e2ad1 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=y9u56/S6JbnHW3dtX7SsYA==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=dAi-wvVZejihfqittbwA:9
 a=CjuIK1q_8ugA:10 a=Mqtxpgegto6slhnK0WkA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: E0AtJrtk4AxvAXCFJKhJRhuqkZLYZd7K
X-Proofpoint-GUID: E0AtJrtk4AxvAXCFJKhJRhuqkZLYZd7K
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDE1MCBTYWx0ZWRfX0u9yzaj082/5
 h9QzkvHaqwZZOX96vebjUceUp7Z/BZdG9cDEEgTPViFjR3IiDxL9c7mgO4yWEE62OBg/bKOAdUS
 /UZmq+toGDsvmcPWKict6DbY2fS7p90=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_133635_853359_A8DE22B1 
X-CRM114-Status: GOOD (  19.11  )
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

--zjnd5hJChYYzsEVt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Aug 12, Jakub Kicinski wrote:
> On Wed, 12 Aug 2026 18:11:31 +0200 Lorenzo Bianconi wrote:
> > please drop this version, I will post v3 to fix some pending issues.
>=20
> FTR Russell was trying to fix TSO in this driver too, before giving up
> (on us?). The direction he was following of clearing the TSO caps in
> ndo_features_check and letting the stack GSO instead of all the weird
> hacks this driver has seemed much more sane. But maybe I'm missing
> something TBS specific here=20

Hi Jakub,

thx for the pointers. I reviewed Russell's commits and I guess we have two
options here:

- manages all the TSO/GSO checks in ndo_features_check() (stmmac_features_c=
heck())
  and disable TSO/GSO if the selected queue does not support checksum offlo=
ad
  or it has TBS enabled. In this case I guess we can drop ndo_select_queue()
  callback completely (it does not make sense to me to always use queue 0 f=
or
  TSO/GSO packets, e.g. it does not allow proper mqprio offload).
  Please note this approach would introduce some performance regressions wi=
th
  respect of the previous implementation.
- implements TSO/GSO checks in ndo_select_queue() callback
  (stmmac_select_queue()) in order to keep TSO/GSO enabled if the selected
  queue supports it and at the same time do not always use queue 0 for TSO/=
GSO
  packets (proper qdisc offload). Please note this is patch I am proposing.

What do you think?

Regards,
Lorenzo

--zjnd5hJChYYzsEVt
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCan4qzQAKCRA6cBh0uS2t
rI6EAP9J25F2Q4gh4miQLO8THVQ860oLdyW+dsFaeCCIgsuycQD/Y8L+jrNdnTer
JzDtEwYoeEhEuyDRElDyMFqQeZT0Qgc=
=TZyt
-----END PGP SIGNATURE-----

--zjnd5hJChYYzsEVt--

