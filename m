Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34DEA10A88D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 17:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b6r224pc1M7FavILiplRKh/EJYto+mOVLIPyko1UisY=; b=CpvguTMjOguTrcDevZpW+KYsvt
	zgzh8rezSLmPp9vqWq6qtIO4XPtqaI/v0fqpmY9ah+rhNrKOAru4NGEMfTUcsCOYr2WY73+CnoYY+
	sJTduBoCXZr/OebxOXf+zGsIBTq2I/Xr20X5j00+MNnLGe08xXoSgykIbpkyrisJurRyPx2pxINeQ
	l588i1ce5C7NGBi4QqVeEx+p83CoptDZyHWt6k3yA3FRUZY824QWQVy0WwXyFSAhpvGpJ6+X3Fwns
	J9qjSG9147lyxCRKYuZfFR1iwrxKoAz67otSWzAiTgCp2oDnbjUcXN+ZLSei57UUsNM3DixUSu1+U
	RPBQYesg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oEa-00000005v5V-3HY8;
	Thu, 26 Mar 2026 17:11:04 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5oEX-00000005v4X-1yc2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 17:11:02 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62QF9lH03373806
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 17:11:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	b6r224pc1M7FavILiplRKh/EJYto+mOVLIPyko1UisY=; b=PBa/VAJKDWUOVCJh
	SAvo7r2AaI20OYOCQ7eTqtY9mvLEFxSfMDJD7Z3vDyx+1pMoOmncEOiPnCHj2k3W
	NukrL5O2dkgG5oE/xLDVfAtwp2aYBhYO1vmyJti1+5/7XpAI4NFvlC0IQYp6BAt/
	K3skqdl9V6Wbq0HaXfEsAFsLan2xW93/LGIC7Z24w31nqwgJ2hYGABRG/xs+Q2kT
	62LoDxOSEC1QPY++z2QkBK62abEbU5MpcTO2cE6BCE9IcSU1iL0J1jrRzbZi0uvS
	coT/62eWrjLUQ6w8ydXqm6LDjZIIOOB3XASWyBqYcqVHK513h6nZ5SMHSQXfWCzH
	4goNQg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4qksunnx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 17:11:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b06c242a34so37141005ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 10:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774545059; x=1775149859; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b6r224pc1M7FavILiplRKh/EJYto+mOVLIPyko1UisY=;
        b=gMmHhK9c0H/TgacRL/VsnPjIX7mgmj2vuzBw0Q7d+KN2wdebATYLoMjqC8vEj28+wg
         tKAYIqbyUE/P3V28KZOrhI3bC1uoO2gDvhXHzxDdQLvekWpAWGI2HVfJeMYSQnhJFOzK
         nw6S3XaYtJWNBhUTNIz877sPtwCiZYir3DdMi1A4sUI71vVaeHrM4naaZqkD+GaN7hpy
         j0SM/kTMlSQCEtZN4Lk95ZELg8vSmN/VS1fBOVIN3hieWs4ClgKmIOyCT3aJtDl8+Xk5
         E5SrTpO5nUnyrof12Qa42UU2KDjYGM45vkiM5bbMcDlAuvvt0U7vvVegbjWBr5xMrxxR
         Gvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774545059; x=1775149859;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=b6r224pc1M7FavILiplRKh/EJYto+mOVLIPyko1UisY=;
        b=eDp2oKLxIoYJ5IkL9DD6LutqYahbzYWSkQONWyUzFccQE0jGG1g4FVHpqUnSDFKdgL
         rA174JPuOciPf5WOfFGwoh7ExUl/rfTodWva+Ed0s1SnMIsvf9bJbCYEcdP/PYEhS6Yj
         mOvvmIglCkjNJVE5yOtXZ7jTENf0LvnBRVL5CO4agA5AuJZOZ6VGIC1Bp4tMe4p5vvxj
         WcKXlkMOeBfa1NA2KezpM2wuSVR5kecpiXx58Zw4h58WIWN3LtDwoER1yidJg/h/IqjJ
         XmCwlBga5DWFwfVPlYcY6AVK2hl025Vm9P6ilzo3dFRyUOb7wKwP7tQj7TVLzgWp5q8u
         /8ow==
X-Forwarded-Encrypted: i=1; AJvYcCVC+I0dpzkTurRSaYeTvpIWwdfoOek02F1bz+OPq9/NJr7GFd5As205sJjX5OKxDmunGJILHdkOuK9O+Qe6PWRs@lists.infradead.org
X-Gm-Message-State: AOJu0YxDuhuSMC7bgmecqp5VBzhzXni/xqql9aVneQN14Ap4vt971mYr
	tgFVRbwsO8zRvW/vZZRVyiSUZY02bVjuzYuYXTgB/QIe/3iynhmVggDWSaJ8QLCpODk4Pv7Nded
	x2bGh1X8rfb7dVTaiZMIWH66/gBAs2MbepclPPfpntXpUW0kVi/EDwW2zwGdp9uV5Lv2Gng92DV
	UDXQ==
X-Gm-Gg: ATEYQzxSL6cniWx4nBZSpsWInTn6DOqRtl2BrDunWw6m2iuWgBynVd9sKutSMTen60g
	CsDb5GQv0NRbHCOn1lnWY0xEkf7OYJbpVOaLJmIvcba4wP3tonnZWMq/EAdbk3PPmdEIiAhYrZF
	edR+qD18ePWjFJZWUyxOLn7EGxxTOaTMTpemwiTazQXw71qYQfu78xRTPMS0GJcb1nJEYCxUVex
	E4tHNLu/r5m2Hx9rVy6x4MtraxS9d+h5ydPgScQ2Gctwvn0rINB02Sh8mQ5gL69KvZEqqFjGrqC
	XtpXi1GhNpEzLLYSKFv8d43bgzY3TEnK+ObEMaDVEZKa9BtM/u7LPP+qiMSiCYRrZJzBELyArqO
	ZKGQ1Bf7dTbZscL+7HZf7szA=
X-Received: by 2002:a17:903:1b08:b0:2ae:567f:fd7f with SMTP id d9443c01a7336-2b0b0b5cb06mr95353965ad.53.1774545059072;
        Thu, 26 Mar 2026 10:10:59 -0700 (PDT)
X-Received: by 2002:a17:903:1b08:b0:2ae:567f:fd7f with SMTP id d9443c01a7336-2b0b0b5cb06mr95353615ad.53.1774545058539;
        Thu, 26 Mar 2026 10:10:58 -0700 (PDT)
Received: from [192.168.1.102] ([117.213.101.231])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc8c4bd3sm37507945ad.63.2026.03.26.10.10.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 10:10:57 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: hongxing.zhu@nxp.com, l.stach@pengutronix.de, Frank.Li@nxp.com,
        bhelgaas@google.com, lpieralisi@kernel.org, kwilczynski@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, Sherry Sun <sherry.sun@nxp.com>
Cc: imx@lists.linux.dev, kernel@pengutronix.de, linux-pci@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260306021247.991976-1-sherry.sun@nxp.com>
References: <20260306021247.991976-1-sherry.sun@nxp.com>
Subject: Re: [PATCH V2] PCI: imx6: Change imx_pcie_deassert_core_reset() to
 return void
Message-Id: <177454505296.455880.9671929759521493742.b4-ty@b4>
Date: Thu, 26 Mar 2026 22:40:52 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI2MDEyMiBTYWx0ZWRfXz3uW6mH5XJnI
 IMQNMD+F6/QidQDDs54qm0jo0IH8qaBKZL6C0EZrrD+mhhJsgXVkJ5yWZsdB4pf5UvwAfE8lirQ
 Ab/5qbEhc6tkMH3pS+xAA7PUO2YAkllPzwufGJwf6zLM9aD1S9Sdi+H3DBrR7wKNsG0aMuciw+l
 D6u3iqFjvXmGy8Xh8Js46iVuSJhStE622N3G4wUDF6HeIR+IUWcL9Ym6cj1gQOgCLbINnEr9+OR
 FKv+K3f8AgEnpO1BOg3EPGTXvcOsY9SzQ2VmhsJuRDvVPAIecbMV8iqRc2apHui7buD9G7XeLZZ
 Vie1C9iZp9rry5AWjipk9OLbnSs0n6LEN1O7MYRytX6/gVw4+7XP/RIkhU53bSrHU4xqOB3yliy
 egEsSDgemm+5gjjZ4sKrEQmybyWub5U2Qs2vnUiwGWVuf9FcTu/Fs5x0D3xHOKC1sPLzEZ9Pwc4
 GdQh/pb7TyHPPOI2ToQ==
X-Proofpoint-ORIG-GUID: YM8mT8lfaunLQ5txoqkEVG_Bx5A86h3H
X-Authority-Analysis: v=2.4 cv=eOMeTXp1 c=1 sm=1 tr=0 ts=69c568a4 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=pjPfvbXasfe8cMZvnaMi6g==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=VwQbUJbxAAAA:8 a=pYN8Ckv6pxGYxkbxldgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: YM8mT8lfaunLQ5txoqkEVG_Bx5A86h3H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-26_03,2026-03-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603260122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_101101_631931_60B79F9E 
X-CRM114-Status: GOOD (  10.67  )
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


On Fri, 06 Mar 2026 10:12:47 +0800, Sherry Sun wrote:
> The function imx_pcie_deassert_core_reset() always returns 0 and the
> return value is not used meaningfully by its callers.
> 
> Change the return type from int to void to simplify the code and
> remove unnecessary error handling paths. No functional change intended.
> 
> 
> [...]

Applied, thanks!

[1/1] PCI: imx6: Change imx_pcie_deassert_core_reset() to return void
      commit: 192b8a1bf81c17852b6cf540c95b0a3bcc9c58c4

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


