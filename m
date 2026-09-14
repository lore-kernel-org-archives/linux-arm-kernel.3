Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E39C88E64
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 07:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6OvIkQ7WXbvC+cMXKjpvm4sPjisZNwPMuEMKh4zZOLc=; b=aLwq3QlTirK1pXL9bJ6JPlcgKA
	s+FmLm8b3pBWh7j7aFWCMawgJOp4SrYIqF5I7pXyV4epHCe/mkTmv73/oSm+FVcJeXmpnqLJaRRcn
	V5bhQJnHCHSSzWiqEArfh/S/WfengLWpUMNvDnpmWNx6r2P/0Nn2TqUN3qL67ySbs6vYh7OX8sFkm
	Su6GCHtJkISoICe/Kkd3ibmNkzFCDEXQQ7FSz7SOzCCULXhcR/8/Y0la52O4p4SLS6uG6B3i/TUwg
	NDRRzJ576PKFhDFEHViSrUfh0SfRiCyNieO8V1M35y1mrNX4T4Vha+acbpyM5ts54ZqDpYm+JQwts
	ycPc8WQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60qL-00000002XDz-3AcO;
	Mon, 14 Sep 2026 07:11:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x60qH-00000002XCn-1C7S
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 07:11:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5ifjd3368748
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:11:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6OvIkQ7WXbvC+cMXKjpvm4sP
	jisZNwPMuEMKh4zZOLc=; b=QAhZ5JF0vMZvzJ9c2l5tLcd8u0/o8W6LrsQNe3KE
	3qDIDG9oquWS3QOfFPp6rwWbQYWQdUqIni1t4/bDIY2yP2vFu2bcgbDPQTiwXiQK
	TO86wcd+jK38U1QV29/tWLBL44ebVwcc8TAhPsENBVBTI5lTtAlMrGD86RZTWZje
	AEdw13XSwncNQTEu1AtoQjILJvMB0Q9vM7om9XSv4VEXa/3Z7ywXOMO5eziLCwG/
	yk/YibVvOaliarQgoWYax4w9aQ1e5DiLDPXxlRbhyG5OgapEHznLqpDeOexIP6v6
	tHlwWpIJu/jEgaQKu29zAnhN5vCempN/U8/7+go56mDufA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmygd5fm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 07:11:03 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e82060977so593292385a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Sep 2026 00:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789369862; x=1789974662; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6OvIkQ7WXbvC+cMXKjpvm4sPjisZNwPMuEMKh4zZOLc=;
        b=M/yaKHGHTFirgmJ/tbU7gTXe72cmpPrdniWqCpbAmUyXSyEIPCHvD/IMIt5vCYMauR
         97EvEIpshDrBWx5R5KysiVtOPz3dbP/uCQu5Qci0lNUM+ZjvqFXCDjp5yu5nFYpmVy8z
         uN8qMoWksk1opzvm0oijqPLnNY0Tfo2YOLjgCPZvnQs7rt66u1kVXQXt6a7u35uC851P
         nbyWvxmRu8pTUfiMbbsZhgkEgiA8RnBDqCWsG8p0Vl6DMwXLXoNjuIC4zNkOIc9CJHfu
         3FrkY2fVYd9+8jQCYdjKhv7ONAUUiuE7ZjYr+g3sprXP5dAvFtsbtESEvUAkWTqyoT+F
         GJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789369862; x=1789974662;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6OvIkQ7WXbvC+cMXKjpvm4sPjisZNwPMuEMKh4zZOLc=;
        b=cILP7DNUq/P7kWujWkpggxRTcd7hrlnk2YFvZ72ahb/zsbOvQaJ5oDBBDHgKMNHUnV
         H+lmIEIb584MOxFxr6vQvhedkooUp9tVasd8MnEhdLsP1Ip5ej312pJuD4iGmyAT1e3z
         orU4s0vddj6dI23KCqMwsY+8PsthIM/2QoMlvRDWb6zICKnCN339qUAVz0VtNyfl93Wz
         L1xarett/u1cyy1Wgnb4UW0IcV20La0G686pVRLAWXcovEJW8Rgv0qsku/o7lCxGAFX/
         ppn+cdBB780v7L7p+i+D92PUdjDDHv9e5+ClPTT2AJrB6S678zWvX6YRraqENb86FtLA
         PZ/g==
X-Forwarded-Encrypted: i=1; AKwUvBx9q4v/UuBb7t/JfmUm7hC0OxGsEJY3SkmCL+0q4uK3oUuJEqntdUbDMyoGFJEN1UT/YovCB9Iz8P4o4BRuEAhe@lists.infradead.org
X-Gm-Message-State: AFuF++mHV2tYTIDldwFaSSzw4FAuVIVmpZRSviuxqiW0zCB+3j7PuJUq
	j1nLvwu4EhfKbNCI+Lgcc7MGdv5cElhfPXjXDRR8rHCcYs4fvyLqOFSkIJVg4TlQHXRcLHjiCbT
	yudgcplJtC7zJPMbBOSX7TI38gdG2KsXl+aL250+dGU3nwHHfYiqen4o3GpKjj6d0N5ijTqmE7m
	/ehA==
X-Gm-Gg: AYBFou3lXFwGu3UnczayELOxRGAUiepG8HCyEO9heF2blRWecelWqea1w932JbRPWhY
	ZXQlPkUfgURfqotdvfJva+fIC5y+i7quA/nCLhqhgtjtHecGo79+tG3XiobANytbrJ8vyKnNy+p
	zQsD5A4ZfjODdP9KsHGRA3oQr6/PGim3lIpAgFZBHW9nXxupnicoLDwQ3nGHinY3KYbnWL1IAVU
	tZoUTHJ+1OFezHFHxEQix9bnp4apHraAJ5MYT3cXa79ut+D8V4RvsWkHsA9RnPqs4Cj3x48BLg4
	V4MTuL2vZTSJKwXr5XdRnG5UpejRYu3rsjgn+0Yw2C8VbvaXHf0P2JrhdQaVzAriYTh9Tph6jZ0
	jNZh+J0NCQGcbnQ==
X-Received: by 2002:a05:620a:461e:b0:93a:5d6:9ef5 with SMTP id af79cd13be357-93a185a8922mr528237585a.12.1789369862473;
        Mon, 14 Sep 2026 00:11:02 -0700 (PDT)
X-Received: by 2002:a05:620a:461e:b0:93a:5d6:9ef5 with SMTP id af79cd13be357-93a185a8922mr528234685a.12.1789369862013;
        Mon, 14 Sep 2026 00:11:02 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486f0403125sm21787846f8f.8.2026.09.14.00.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 00:11:01 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:11:00 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Gal Pressman <gal@nvidia.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rahul Rameshbabu <rrameshbabu@nvidia.com>,
        Carolina Jubran <cjubran@nvidia.com>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net] net: stmmac: report phc_index as -1 when no PTP
 clock is registered
Message-ID: <aqeeBOjej4CYTVGZ@lore-desk>
References: <20260912-stmmac-fix-phc_index-v1-1-26e1ead25324@oss.qualcomm.com>
 <2eecb396-8b5b-4e82-bff5-c163a6c16bb3@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fUqptj69rX3noc3V"
Content-Disposition: inline
In-Reply-To: <2eecb396-8b5b-4e82-bff5-c163a6c16bb3@nvidia.com>
X-Authority-Analysis: v=2.4 cv=RY0FmFtv c=1 sm=1 tr=0 ts=6aa79e07 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=sM7fFmaBarVHFOEcdfQA:9 a=CjuIK1q_8ugA:10 a=lUfVGALKYBMCpC4gGrwA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEwMCBTYWx0ZWRfX6dT2uWIbiW+0
 MVgItpt1peZvO4/QamwkYWh6PVwVcScM3o/1M6RGWw33nBpsyFp6zaNqRsX41TAo/0tnSPP7Cps
 6zTmqqdCwpWXzzoMNY4MVO0YVy8usyV6gYEc50Er1DPxK/YWQyGT7p3H7MTf9dB8YfjION/nmcB
 SmYMgpAIqJw+9/JRyCwOYciAUKYMP3E/mcp+8TS0B1FuuDx7e25po5wjWH6e2Uv5iLPu2vVWyBQ
 mM5d0Qz+v+JO8D6Ey9/fLjOmt71GKZBtktBd0GsQuXfTHoQr90m4JnqTif1+yOojg+QNoDHSur4
 K4xJeY7vMdNoCQbM+K2ItSj5n55PMAOgctQnZUcoj7N/uHYChf3o4TaeMp4ifXlVGZBC18BC2Fq
 m+ii36nTvAlBxgBkJpK30WbqDWaOFpWUZF1bjY+MkfUiK+cVCPFDRLi+JMa5AZ0nHYJDvYZWZ0z
 E9orNtdt3h6FlfMeEkw==
X-Proofpoint-ORIG-GUID: ok5vNnwERvl0Ags0OJhOIx3FUdjrD_h5
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEwMCBTYWx0ZWRfX2iM+MaWAVFG0
 oWUccHKiQC0EiZxfgR/Dc7TnHfeZztJr7MnX9+mY/qMtr51kq1XMDOwrEdKsZkO2U+/YEF4ORSi
 S1Hhv8meTp015tlJyFFFILREQSSqm18=
X-Proofpoint-GUID: ok5vNnwERvl0Ags0OJhOIx3FUdjrD_h5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_001105_334810_AF2816CD 
X-CRM114-Status: GOOD (  20.29  )
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

--fUqptj69rX3noc3V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sep 14, Gal Pressman wrote:
> On 13/09/2026 0:16, Lorenzo Bianconi wrote:
> > When hardware timestamping is supported but no PTP clock has been
> > registered yet (e.g. while the interface is down), stmmac_get_ts_info()
> > currently reports phc_index as 0. Zero is a valid PHC index and would
> > make userspace resolve the wrong clock; the absence of a clock should
> > be reported as -1, matching ethtool_init_tsinfo() and
> > ethtool_op_get_ts_info().
> >=20
> > Report -1 when no PTP clock is available.
> >=20
> > Fixes: 9364fa7fcf12 ("net: stmmac: Remove setting of RX software timest=
amp")
> > Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
> In all other drivers I just removed the assignment, why not do the same
> here?

Ack, I agree. Since we run ethtool_init_tsinfo() before running the
get_ts_info() callback, we can drop phc_index initialization to -1.
I will fix it in v2.

Regards,
Lorenzo

--fUqptj69rX3noc3V
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqeeBAAKCRA6cBh0uS2t
rLULAP9p+1QhfxrKFkt0RxnqCsrRXbe/JkA81oDL0nUz/IVfDwD/YsAbhRIhavAz
alwh47B1TC2mbg02iCAsXavqhs35Dgg=
=bxxO
-----END PGP SIGNATURE-----

--fUqptj69rX3noc3V--

