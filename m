Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B8F0C79FBF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/P1Jv0DF4UzkIT1u26XRyNwrpVHhc0h6XCRRh+gwWEc=; b=s9WoAm6qsFTrdzyeBJgGN4StAj
	vzYDlfhUUZIiXyMD16d7SCp3lcS3mWDqU3hPMOKe1f1onNYyVr3I2Hq7SEyBtunOTRiBQjTFzvLB2
	wirE9Jj/dMYAOBTjcT9OBqmY5msQJftH3sPr1MEDMzeGsHYyjZKPkuFGuRiFwGSBN7aWYXEYKNu+q
	bARkop/bp+q3CgwKtREAJbiM/stysijWJ+uYYjQsrUJ/fUKmyM+GUZEfA3diEu0WoQrG2xxkPFhYp
	L4FROIbRGagTjYlNiCJMY3e64jZw6GVPcR1DnYs4+8v+C8kOZzTyyZ1aSNFvzJZZcIqYcm48b+eQ+
	x23d7T7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hhA-0000000Exbp-3StP;
	Thu, 10 Sep 2026 16:32:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hh8-0000000Exaj-02BY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:32:15 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AF4HfO1326091
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 16:32:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=/P1Jv0DF4UzkIT1u26XRyNwr
	pVHhc0h6XCRRh+gwWEc=; b=Y/HhQ0aAM6DG5jxxIQCHpQpK9SwwKxlFyT+eq+7C
	6DURNVHIO4zTHjNc6u+3t6m2WBGNmcPSfmheDoyBAHm6Bf7nLyERpuqfjg85yjat
	kJdrJQcC/TK+nH9qf904KIvagUymOGsn3k/dhrGwZoTef3S2On0aImOsFkbV5JuP
	uFRyzn/BzSXR6yl0EAK2mpmeBWi1ZivEthkz7k4kvsSgu4oEZrPDLUpJZfphCqza
	649JER6DhqpZLDC7omP+WMeSskEyEWbIr0MFqPV0jOCxp6zLh2Wh5TttyvMFGpuo
	+bw3L7ITgIWIDxqwiE6zd05QyFUN7kwOBL86sX/FwDN+dQ==
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkwts0vj4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 16:32:13 +0000 (GMT)
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7e7624e584dso9568977a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789057932; x=1789662732; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/P1Jv0DF4UzkIT1u26XRyNwrpVHhc0h6XCRRh+gwWEc=;
        b=haryz9I0xiwWHNJikwqCt9J0u8huVM89pJgfrOeBblxjT+pS5d/Dl+lajUjTFytSou
         Uu6ncyHsxlLrnRTT/epVcMjHKMwxXKb/sKbSGy8Uz5NWL5PvB+8182WCuYh9kuIaLP7v
         lvK/wZ6U2tPELNUD90i2O71JGpZUzf7y0/p/XwCAYChJ1TsFaNKeCN9SoZDfIQC9/f9e
         7suBl/FPYeo9e+5Siv91TepD+9ki2xGvpKXBCLTsfaIhje4542tWlYYtup3kQkltRDGh
         89INXGvTdDhXOkCasBBV3pGiSLfu82XspWo0vnuhdOyskCZUps0x3tIO6ZBT2naTONx3
         fj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057932; x=1789662732;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/P1Jv0DF4UzkIT1u26XRyNwrpVHhc0h6XCRRh+gwWEc=;
        b=CjVvcRdoROhJTMqksBtjF0/qNr7gTK2a5XB4PLEjyM5oG8nDDMHK1kZ4rU27Pkp/3A
         taeItt/lb5hnW14tX+tnxj9gcEAZbr47uWo6jjtg0D8t9wfT1HxEK4hYPnoS9l2plYR5
         nDr5nUeVOCPTW4clnwZYgbfoHE/mm612pCRBHkquq5Sqia8TFxzS9B7PlYUFBQmylqbP
         kevnafBZOr4/5Mvaxaw7tDoZz+uEFYcQPt98VJ8ktxLRgFdBm5nMI3AYXn5MPJGVO7Px
         oDE4suIeDBGzI6aloRyThc6TcDhZ9Tvzahw/Byz0hQMFgRYeTLnkQeTrwNw6A6OojKkI
         J71A==
X-Forwarded-Encrypted: i=1; AKwUvBynv6sIyHlJdPK+xkNuCTzZz6aVzNkxJsG7h2YZ4eDvqrj2YBUDf0vrMH+ZvqexEih/tVXFWORYsHV08J0V1ZWd@lists.infradead.org
X-Gm-Message-State: AFuF++nTyCC2x4SaRlDV+J+weMgR1iL11gA2NKuT7ojdB4zIaLm+bJzU
	8heSRK9D1C9xrgc1eYulKnaRVc4uaV5+uniPUAcVpBtVeIqBrP7EA7A8W743PUME7pwvtqA++Ji
	3xRmoYMW3L6Xlk0erWUvDHwKSsEo/kn4HlZZTYgyLg7ITXGcvZBI4DDxnY9heoqPG+wibzgkQMI
	4klg==
X-Gm-Gg: AYBFou1hnqS5VixfwY5Xg5fGvzf4AnqOREi6jzzS2VV4w0gBXEON5aBzp5fQMATCoUu
	jitjjQir0rGaU5/MB3FqOSu4uH99DN5gHFvrXtIJIaP5tFuLP+a8tPcfZZ2xFXNozTnUPDkUm/2
	RjWWmbGAeDI1Qg+V2l8qdK4Q90ehUfeiSQvBobm2C1coYj+IbqZ7+Ip48IyUtEK/mY8y22YNvR9
	uVs2CFEMc9eKzthhu0S/x4atxDWuzInBZIAqZL8o4IE0ZT/IBQffa4MZf90aolCWtn62IgPtUQh
	hpuiizHbBJd3angF2pU8dbCvkc9LCoqmvMCTMkdguS3skifVB/3Ig/MMroOeWna5U18OgpdX1Qm
	hfSVGOUBnhk7hUg==
X-Received: by 2002:a05:6820:8584:20b0:6ba:3635:8010 with SMTP id 006d021491bc7-6ba36359c46mr10463464eaf.67.1789057932481;
        Thu, 10 Sep 2026 09:32:12 -0700 (PDT)
X-Received: by 2002:a05:6820:8584:20b0:6ba:3635:8010 with SMTP id 006d021491bc7-6ba36359c46mr10463418eaf.67.1789057931956;
        Thu, 10 Sep 2026 09:32:11 -0700 (PDT)
Received: from localhost ([188.216.77.92])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c38e3asm90572365e9.9.2026.09.10.09.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 09:32:10 -0700 (PDT)
Date: Thu, 10 Sep 2026 18:32:10 +0200
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Richard Cochran <richardcochran@gmail.com>,
        Rayagond Kokatanur <rayagond@vayavyalabs.com>,
        Thierry Reding <treding@nvidia.com>,
        Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net v2] net: stmmac: propagate PTP init failures in
 __stmmac_open() and stmmac_resume()
Message-ID: <aqLbikuYvneJcNjj@lore-desk>
References: <20260907-stmmac-ptp-error-propagate-v2-1-4a2e8e41e860@oss.qualcomm.com>
 <20260910075213.1c9aff98@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DcyQ1168CK4VEaSG"
Content-Disposition: inline
In-Reply-To: <20260910075213.1c9aff98@kernel.org>
X-Authority-Analysis: v=2.4 cv=PIaaavqC c=1 sm=1 tr=0 ts=6aa2db8d cx=c_pps
 a=z9lCQkyTxNhZyzAvolXo/A==:117 a=WpTaRW6qxYHRGzLzQsVYzg==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=zKpTHd943Rx03GREjosA:9
 a=CjuIK1q_8ugA:10 a=vQJXkPjffEpyFp3C77kA:9 a=EyFUmsFV_t8cxB2kMr4A:22
X-Proofpoint-GUID: a8SlZvZ3TKqd3b_SRv6FrnGkbP7Zs3iV
X-Proofpoint-ORIG-GUID: a8SlZvZ3TKqd3b_SRv6FrnGkbP7Zs3iV
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDIwMSBTYWx0ZWRfX3ij/Cmv8yJK6
 MB4FDiYPSOingb+eFezrEwKvSDriuYzi642tYeTD8FGuf3YOHDksWbL4e1W4pyNM2wjzVE0tge5
 5t5Rcx1UNFBWwzsKfeVCleWYi0TgVS8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDIwMSBTYWx0ZWRfXyt0v7XLnX6SS
 8DSDhgT/ImaApvdNBrGEi6erLTZeTFz1uRsURmtFGm9lfmZX1SNnPQaY00sO/N3lj/XMi6btM7A
 WcdHngB6Y2vgGoelVAJxbnvl2uHa3g+nAyMDFi5zucwm6Xir/F3MyA41yH5KyAiRst6cAb0NNxe
 C2T73FFs+5UfrqYuupYzDZVu5CJuq1uGu2v4TO0RHrYxb2HEJOnlp+AH+9tk/SPruHbL/T52Zsz
 ogJc7WrWoKwg/kwypwBXM27hPuX1G9egH7KGF3awweFUlux/MUl1VeazldDO52LIPcS2yHrjdpI
 qX5uDiH+p9JWvRW0HEPEORyoW7hR00Uii1fAv7ZxEDdRRRoVf6L1+FAb2vJv6no7Ors2qGNZ70w
 ERv2dGAOiSn1P+kPEWSqwP7xqNoxeTNbVnwHh69EaA6fkh5VbkyinAF/fxFFMP5B/nWiqqcF64/
 nCql6jGThVlYMDk4w1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_05,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609100201
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_093214_051374_D69AE413 
X-CRM114-Status: GOOD (  18.07  )
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

--DcyQ1168CK4VEaSG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 07 Sep 2026 13:50:46 +0200 Lorenzo Bianconi wrote:
> > stmmac_setup_ptp() returns void and swallows both PTP setup errors:
> > the PTP reference clock enable and stmmac_init_timestamping()
> > failures are logged but never propagated. When they fail, the MAC
> > system time counter is left in its post-reset, non-running state,
> > while the driver keeps operating as if timestamping were up.
> > This matters for TAPRIO/EST qdisc offloading, which derives the EST
> > base time from the hardware timestamp counter: arming the gate list
> > against a non-advancing time base would leave the schedule permanently
> > stuck.
>=20
> pw says this didn't apply at the time of posting

ack, posted v3.

Regards,
Lorenzo

--DcyQ1168CK4VEaSG
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaqLbigAKCRA6cBh0uS2t
rAz5AQC5mqUXWQW5lWcrVqX8VwH7UExQ5V8EJae67/Mr1xrXJgD9EZlnC4/Qpq+0
SYzMVRkB1CBnFcHX4kIqKAF3WpxH0w0=
=phU3
-----END PGP SIGNATURE-----

--DcyQ1168CK4VEaSG--

