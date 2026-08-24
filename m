Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2B0BC5DF9C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 20:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EWHnkrfDXtB/l+0+YcoAv8lTzyFJOx55lU4lIaBBSvc=; b=QNwL9FghybuqBuaBJHP2AcywxR
	PlB1eCucDRPl4ptL+ZQCtmzEig1G69QQb0hALHzgfwg3Z9d6LnLrUiS/5rfp3bdYo//iFY1Li9olz
	vJ5Vq9wYw4dfYKYXM0ZfhUR/EFzuLI8cdTn6qB448OKwK+tKmAAsuZ7aa6KbnnstU0M88VEGTXrzB
	u8QtPz6Bzlh0nRAPk/9SWa2TW6XG+JA6UKUUUxGP/v+9oi63DgrJRJjrid20IVOPLfD4LD/vqCXRp
	CnVkoEtNPiBk+IrOQB1PdyVD1XBmdrN4K1Y1nSxf8cFHWHb+O38mRhwqo64rZNT9+jk+CgG9hM5YH
	9GQfU42Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybAT-0000000HMCs-3cft;
	Mon, 24 Aug 2026 20:21:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wybAJ-0000000HMC3-1M6f
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 20:21:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67OJGoSk2844160
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 20:21:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EWHnkrfDXtB/l+0+YcoAv8lTzyFJOx55lU4lIaBBSvc=; b=oyxZr08HEoyfaHiA
	NAMNWGiuoED2I6bsweLfrcrbK1ZYuUVm0wv3scdNyVXKwDLRS4B2M6zJ3qto1bZ/
	yuyaZj2l7q6sNKkWunirRf49YkTFIQO2jAiD3MJtOtVhLaVTehR5ar5Vykqnvb4z
	as2/H6LGmAPg9ubM7UCOehg1cRaz2tGrit0QBqM7qRHtM0MXk/HFquQzTcuKBVGf
	/VFDR+m2l+v0yEuGAR6cLth9KObNgUqk8s8pxHMP0mxitThgrF9xBD0ibKUJdj5N
	ay7pSITqAfJJpL66zS8UuMFeXp1PAOywsX5BwHN8nIV9x0twWmo83/5IJ36U3iYn
	aPrndQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g8kv7am6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 20:21:06 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e5a616d07so4924955a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 13:21:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787602866; x=1788207666; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=EWHnkrfDXtB/l+0+YcoAv8lTzyFJOx55lU4lIaBBSvc=;
        b=dGWdZDbSX6jGo0xoTyWfXkkEOVPD25WgX846NzWaF+3lWFQIYS/OVtaaxD9/Wwr5ka
         pZ2e2bSHHbXeOs+Yzwap7sO62i9mQkWO1vmFH6Ao0Jk+eH/pJEWjmIEYlyGn1QNTpN8Y
         GJ1y0cWxcuHHcHQS35SuqYk+DuYgze4PBI6iMROxoUZ5QLY7kzYZLiVlSY3vcDNv2Cyv
         koIFN2ZkZnJvbXUH9jL6mKAWaECFnPVM15CdErUonJL3lOmFG1Vw4Vpd0srC5Ox1OmvX
         WqrLXGsXGShZ60sgLI5d2HIe/NYizrndpGKcOffx0ne96G2O/G0vXmmEkDNoXIBK3UvR
         ESxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787602866; x=1788207666;
        h=content-transfer-encoding:content-type:mime-version:organization
         :references:in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EWHnkrfDXtB/l+0+YcoAv8lTzyFJOx55lU4lIaBBSvc=;
        b=e7EgT6Drp2fiWg/lhxFOGHyv9cBBd83/QSjzyBAcfoJyLwvTFOP6J1Rdj8Lw3kBMIm
         32hQwlgr/y0PmkUatmb3AzCB9zvEsUeioDXmOW7NZPraDnwnh1nvzA3CR9WoeNdrN7AO
         zuIFb4kvHee6hBCdP45Nexd4u/RL0F6FlGp+opZfH4MocT1vHaRdJskOc6nqqFRnHDu7
         6Jnj8fu/x0QTAH3gKOcSc1kuWge6OkyiQbofZ+vmRqpU3dlkUGa2O/inbrYq9m1Brl3k
         DsIYbyL21rAZk3yRwz75OlQ1Bv2O/Io4lH4VyuuuWRUyWopnDPCX1+ttDMheQMZDl4U7
         l/Ew==
X-Forwarded-Encrypted: i=1; AHgh+Rree1Np0oMX53eP+CfZeupBYMXcAWenOEsXadFmHdwb8FDVZiL3vzNhdVI0VgTc0MaYyZuvtl8/LrRTZvpDM+ri@lists.infradead.org
X-Gm-Message-State: AFuF++nhGgamN8dcjK9UOJiNd61rmmrExvD/Aj31kedMOMeZNNcjKN03
	7wnQdJyIbDSvlgEHPN848T8MBr9+UezNNDeox1o5qjrm3EoCBI/FwZzncgfx0hE3lPI45Pz8/ab
	YOSAzO9REtu1DyiVL246ohQSaIoAAZEsWqCWjZ15sOL88CHvePh14YiG941tg1VCSQdeltyuTsx
	Z8gA==
X-Gm-Gg: AR+sD10/kd0hkXuVbr1hgytXSjsKo+8ilvugJjtZRHZ4eJoZkbu57aGd2+n7vPTcqNZ
	Gm6pI4Gwlnwsh5CqYltLCu0EnLiR2SoCaKe+lYyuMoyW9Xrud4j14o/Y7Z/3R28/dKaMtLh2zgp
	S7FJ5E/Ex7N5e1SI5tEInQ72LIx3drlX8Jxz5sO2QuMN8HJiaE5BhrHDtr8AXlix/J+jxvnIfo+
	QO+5+9roHnxXMoJnDbzKBxQBCMC32l12zsttRg7XC7mb+wV9N0+LegX0vzpnlsqi33d19MXW6yX
	CKuOZPQjxapihi4GVr9v7uNCeMzRBLXw25ItYQc11Oee5LtYZ0j9g5slP7Mi8vXGVqLMlJes/7W
	JAQSxINgoRgHccObhoE4In7+R1g==
X-Received: by 2002:a17:90b:2e4b:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-396464a18c5mr2844840a91.10.1787602866090;
        Mon, 24 Aug 2026 13:21:06 -0700 (PDT)
X-Received: by 2002:a17:90b:2e4b:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-396464a18c5mr2844738a91.10.1787602865654;
        Mon, 24 Aug 2026 13:21:05 -0700 (PDT)
Received: from localhost ([50.35.46.84])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f8e2a730sm30617617eec.0.2026.08.24.13.21.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 13:21:05 -0700 (PDT)
Date: Mon, 24 Aug 2026 13:21:02 -0700
From: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel-team@meta.com, Cristian Marussi <cristian.marussi@arm.com>,
        Breno
 Leitao <leitao@debian.org>
Subject: Re: [PATCH v3 8/9] firmware: arm_scmi: Initialise known ACPI
 protocol devices and channels
Message-ID: <20260824132102.00006822@oss.qualcomm.com>
In-Reply-To: <20260813-acpi_scmi_pcc-v3-8-cb6b88b4ebb3@kernel.org>
References: <20260813-acpi_scmi_pcc-v3-0-cb6b88b4ebb3@kernel.org>
	<20260813-acpi_scmi_pcc-v3-8-cb6b88b4ebb3@kernel.org>
Organization: Qualcomm
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.51; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=Cfg4Irrl c=1 sm=1 tr=0 ts=6a8ca7b2 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=qC1CW/w66vtJz1P9yTJxNA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=WWDN7_Rpj_YlblzOS3IA:9 a=CjuIK1q_8ugA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI0MDE3MSBTYWx0ZWRfXzXHh1Ct8IVeb
 5LcKAXVBN6d8hLXNsO1DzIWaphu/E/wGjePleHar36OCwMoJBNindBvUrm9WL0LQHBb6gE28g8F
 kUym2XhXkYkoam7MKHZXfzRInUqfCmI=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI0MDE3MSBTYWx0ZWRfX8QGeHG0b0j+W
 bZFoalz0HJbvVIYgcc6QB6vsB7EEyvtWwsBp6pZywCYKe2fInGpTl6G9cp8E6u6Zo8HFSFjgKyb
 3T5ZSi5BGUNR24v3di03iOzNuJIIktyvSPPMdslRQcuLzkIv8SFZbJtywquTS/gltgTk2GOYGUp
 5t44FNvVnp3I6xdxhMJyaziAPX3/vtzHiqXPCb/tZ51Y+6DdCzDaM3tZ2aVOJhV8ELCgIh4eMaB
 yJxyIUnJgkOuzqXPvYJZcp2NlN5fRnhLIicVLwNUI976JPZlDt5LUl6BzOw5FGxb6oT8AdjlZrC
 0Ghj5LJmBD/hJCl9In1Q/1TZUfOc/FhFKgKNmYDGhBA3E7B7masP/8iYJU84zoi791dOSSzE/0u
 fH70gHAT3B2BSZcVuXBEQe/IaX2Zeg3jC2FFZKcK138PUf+fQCR/iqqvy7Z0293fCtbZZrpr7Ht
 vF1Iv1CjZh0nxZwrsLg==
X-Proofpoint-ORIG-GUID: w43dTKSWe8s5ofCnRA6RnapDIDKoi_ca
X-Proofpoint-GUID: w43dTKSWe8s5ofCnRA6RnapDIDKoi_ca
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-24_06,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 malwarescore=0 clxscore=1015 lowpriorityscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608240171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_132107_366752_93BFE83A 
X-CRM114-Status: GOOD (  13.26  )
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

On Thu, 13 Aug 2026 12:33:03 +0100
Sudeep Holla <sudeep.holla@kernel.org> wrote:

> Unlike Device Tree, the ACPI SCMI namespace device does not provide
> child fwnodes to represent each protocol. Iterate over the non-BASE
> entries in scmi_dsd_info_list to initialize their protocol devices and
> transport channels. The BASE channel and device are handled by the
> common setup path.
> 
> Let the transport channel-availability and SCMI protocol implementation
> checks decide which of the known protocols are usable on the platform.
> 
> Signed-off-by: Sudeep Holla <sudeep.holla@kernel.org>

Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

