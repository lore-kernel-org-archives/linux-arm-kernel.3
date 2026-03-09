Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8075EFCD9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 11:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9GcFU1X0YgGaDvQY7T0H3DK56rvaH9tLv7mLbV4BabU=; b=ZNVPAsi6yLRWOxknYqx64dtHwc
	6rqUVvZebF+D1nQZib1fn35hlITyypfGFTcDw/8kSjWC+1z7KO1syvWUFp9wxHAytNZFznSal+L/N
	GHVm/wIE3QSamqfOA2oNvLMwANErfSNiM0nskM03jGWGZl4OL+VvtMUv3brwYVdP5+n7ngC9NLHWP
	W6+GYZGVOGS/eoG4f/CGEb+pE5OL0pufHkkDILT6S5F6DNwZAP3nP4UmZ/9fY7WlsfVmTHN/WHoor
	+sAZj7eeSkX02/h8G3A5kkBb11cUvKZvmTlgBERExoTN+zvo3RuRm4NG6lLzUGv0f6CQn3hmHNdBx
	I9f9xrDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYUT-000000079CM-28Hw;
	Mon, 09 Mar 2026 11:09:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYUQ-000000079BN-2JyH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 11:09:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 629AMGHR1588528
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 11:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9GcFU1X0YgGaDvQY7T0H3DK5
	6rvaH9tLv7mLbV4BabU=; b=PqCeTolUyDUnfQtvNv37mNjqVxegnXKUYob3z2lG
	XphlgQjhQnMquTaJQt7KF2g+f5/98CZ3ail8ZOhukncqxq5WKInf2DZL9bnftxgK
	/FYGhtbpYUYQbYqm3EjwwYAMvrOu1i8U+leKtQFkxaUDN+aC1PDvV/qUzLX4k9ij
	wLYuk64n7KpwuMgkHC+219t+94GHSEewV+gh5CQRCnjiKdv0/E6b19TciOUlCtFR
	wxYLt6veXcikC7E483Dm35micc3IxfR3E46Up/kypL1+Dz4Hm2pbHv4b0uIlCnOI
	4oRIxavDO5KUbDFFXCQlzUd19z0kDB8yAeimdXmFgxkeXg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4csqcy98et-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 11:09:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829b8bb5173so471150b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 04:09:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773054573; x=1773659373; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9GcFU1X0YgGaDvQY7T0H3DK56rvaH9tLv7mLbV4BabU=;
        b=H3RLJiV4zvuWrtTPB6cf7HktDQhrJtCPXjte3QBmb3ixkfN+Lh8iMymmRfJMGyFfCt
         V+OMlJ/BvAROsHD6HmBAoGvil9593lN4KX58ymEZwhLYrEsfFlfBg1Ox1sgq0oOllQrK
         cDp32ifdHjHgdvO1qnAhBzSm3FyA+ZMvLy1J1L2iaHYMnlC57/u60LsysyqYc7Ec43Lz
         +YWEuEQU00CQ8nU7JQ2KdvrpnxLqNE0VEzyt/yzLGeNK7k9kVtGzhhkuvQEQ/+yo5YDc
         o/M8gioX7ja6djh63n4olBcxgwwirkaB8UwXyM0WNP7Sa5kS2mnd+ONE/1FdirhTicah
         pM/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773054573; x=1773659373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9GcFU1X0YgGaDvQY7T0H3DK56rvaH9tLv7mLbV4BabU=;
        b=scupuD5r9tBn3l2wSCd1+9Mhh241W5LpvtJQDlakhSXscPyxpgXQY3D9xRUqsTtaL/
         br0cNQTc9H/0xcaJk0drjHQS9fTWCMmHjIFx/SFe+dgWU/gF/59xwRc8kOTYu5fQSU27
         vGPpfBg9nVdVi3mxV3iV8STHiJ/tVOwRsNb4dNdeb+GzWQE8/xvhso0VwjO04T1n/R8+
         2KICmhhc6jStDCyJPDm8v4nyU8RPZEiltJhDbdJY63Iuc2SxmYEPK9Gbvm+XMA8NESCB
         IFoLsau1GmMO/6TESxf0YB9weAUbKC6Uhf96uLbo0D+bfXWwBi9J7YF7oQbfhNAjRdjG
         GWhA==
X-Forwarded-Encrypted: i=1; AJvYcCWTDRLHcDodfYO2wm/UEEcAEsXJPTSBvCjSNH+PcWqIhMtKA04kb7EYebh/VY56zT3xSEPCtNVBzumwJe+xyCcg@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf7MJBPlhtAh0HyVaT5NC0jrwTHBfAZJUHppTg79rTTC/U5XF3
	5evQTAYjrjZGFAUFweQbT+Pf1k2vWIvfJjAOQ/FlU9AP5AU1bubzMkiTYOKjZE7bC2M6Zmu8Rma
	lwSBB62Iuv4E9RX9ll88SJxZ/C2qjO/Nt2UXvaE3oBqI8k9HvcKWQ0UdMIImTJDTYKboS7QAhnw
	t8ew==
X-Gm-Gg: ATEYQzwUzaNphmeuqJhgT6HQDCESO2cv8imrguUijgjxD/uKIpv/3W23caWW4Ig/z1C
	8+YiUcBVJJmJ5tAIJNQL4ZWFXBYNP1Bzw7mOw52ReyBLia02e02octp+FuvcDQpIsJeil02j9K5
	Z57Hg3wsw6hlUbXo4tbXGzd34Mu8rzGSVBuFXnKWIqP+Pg0bgXN6DiGbPWACwcIUCLcLQ8Kk1Kd
	I/ki62zP/i/ROy+Y8OfQEq/us0J85O+rGwK74eMf8udEqtXMf6UZLYeoCUHOQqYTlQXgpi1u18l
	87I2bPHcbNITxVRNk6grsredgG3QVrUZ9Jy72fldSmFKQWbY5jGo1Z+60R5oKAYCcns9o4FyBpP
	UjK1glZ9nj0hfFdfIi/oKwGF+MQ7mDS9dFmU=
X-Received: by 2002:a05:6a00:3022:b0:829:8e38:65f with SMTP id d2e1a72fcca58-829a2db935amr9010415b3a.8.1773054573140;
        Mon, 09 Mar 2026 04:09:33 -0700 (PDT)
X-Received: by 2002:a05:6a00:3022:b0:829:8e38:65f with SMTP id d2e1a72fcca58-829a2db935amr9010380b3a.8.1773054572661;
        Mon, 09 Mar 2026 04:09:32 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a465b6f7sm11967292b3a.23.2026.03.09.04.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:09:32 -0700 (PDT)
Date: Mon, 9 Mar 2026 16:39:22 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Chen-Yu Tsai <wens@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        Jan Petrous <jan.petrous@oss.nxp.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
        linux-tegra@vger.kernel.org,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
        Samuel Holland <samuel@sholland.org>,
        Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: Re: [PATCH net-next v2 2/7] net: stmmac: convert
 plat_stmmacenet_data booleans to type bool
Message-ID: <aa6qYo+1san7jL/7@oss.qualcomm.com>
References: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
 <E1vzX59-0000000CVs2-3MHc@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vzX59-0000000CVs2-3MHc@rmk-PC.armlinux.org.uk>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDEwMiBTYWx0ZWRfX4H8K16PMIJ/4
 3HGXlRk4HDm2qCYCzB/AYTXquD6gOIJ8Y1iKNyBtlNDcmFaKEtLq1icubOElS18RITM74KRNtzJ
 G59eprUxzVfv1AM0gGVgr7iEhEDxHIMn9cG1ZowQFdlqmHhrAwqlfYTRV9NmZIyuqSwzSSTZQNL
 kM+GV0LfejDuoyDyZ4GJDfph/EY7PJ3W5eoOilj7vxScOGKHli483BxC4t1ze9JISbFOfdBg8Bo
 aR9T66Vymv7SwYv2yJ/3bwtoGlEZM4e1m06RZTCOBp8nEqBFF9Hrfg9itm2p2s829sKonL586dW
 0bijcfvIqmwR33w0djSaabkujZIC4bFeO/W9dHRBigoyxFDyGPLWPpkEKMHsQlYwUbAFs26Mc4o
 pN+zeIGF631jNPBcFK2O61eDmp17KBmTGQZdesJ0Pv6AWXzwXuKcPfzNxdMq3wEORkPShjl+P69
 DZw2eR5ymW9ret9C/ng==
X-Authority-Analysis: v=2.4 cv=QJtlhwLL c=1 sm=1 tr=0 ts=69aeaa6d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=91TNVAZHAA1vfZ95losA:9 a=CjuIK1q_8ugA:10
 a=zZCYzV9kfG8A:10 a=2VI0MkxyNR6bbpdq8BZq:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-ORIG-GUID: 4X4KTr1VQlKa-O8u18WaUauc-tS9caWN
X-Proofpoint-GUID: 4X4KTr1VQlKa-O8u18WaUauc-tS9caWN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603090102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_040934_593125_8CA56054 
X-CRM114-Status: GOOD (  13.86  )
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

On Mon, Mar 09, 2026 at 09:39:23AM +0000, Russell King (Oracle) wrote:
> Convert members of struct plat_stmmacenet_data that are booleans to
> type 'bool' and ensure their initialisers are true/false. Move the
> has_xxx for the GMAC cores together, and move the COE members to the
> end of the list of bool to avoid unused holes in the struct.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

