Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07FB1E9A031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMrQyicAZEEqH/BJVyGmHveMn6L1dPKlkyYCF6REmA4=; b=Af4kVbU7LUzXXNi7tVca1GT+C4
	uTfPfn4hiwzCeJ7nlMU4hdyLibWefMz2SW9GAqtjhKgbvgZc/uHzqpBIMClWIWS7t8+nwwUL0fOsa
	OHM22HSCRrUUDQCfbjqVrye8vc9iZoWkgyMyPYrTtI94RHrVprd9r36SDmIkd8ohXsbidqL9YPmQt
	lmHe47uRirspm//BFspPSMRLtHsIrXMBI9y1uBvCTOOcBtMMjVaHFcrAWXH0vsiUIr10w4T/pvgTP
	Ex2/Qm7OnjBzCzlcYsP7toioGpSsVrApquWPq/k1VH+VSaERKRTrK5J4XQInSYHp20zbd7O27raZf
	FLUYtrFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPvb-00000008jIJ-3NF2;
	Tue, 17 Feb 2026 18:36:07 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPvY-00000008jHb-2pi2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:36:06 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HFe3Wq3392915
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=uMrQyicAZEEqH/BJVyGmHveM
	n6L1dPKlkyYCF6REmA4=; b=PJoYPYWQuUsB5FEZvA830Cal0DSGAMo+QGMVb6W5
	+dkW/CDoED86KiVFlyG//hqnjoEscrW4RLYHTuM9ACB5yFBkz1qYTYyJrbsef951
	j1iRi75pMnls7+m0t660Cuu1/7TRi6O1B9IgeLY2ZpQijJ+IfsFmsr8AsFdoCsu8
	GnvCWUwr0VmtccVe2H/8bIP+CnqKzc20mjEFOJWZBeAgDweS2CeGT2SoULFxFlbJ
	VXC6CkXFWByQXTsusr7jbwnJXgTIZaa/gjd6wba+gTqepAPx2QNIzf7W9gqMc680
	7UUdi6G34Dgvr7IYZu7HWjYs714WfEzqQrEJWJtrKmoP3Q==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc5khbpkt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:36:04 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-824ae2c9ff4so11707600b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353362; x=1771958162; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uMrQyicAZEEqH/BJVyGmHveMn6L1dPKlkyYCF6REmA4=;
        b=Hn1yXpSAeHm8UCnDzwB6jJA9EMQ8NkqCzBG2lV2Kx4H/CFFV5lD73RjjNPQWhggadm
         DFRw9Q5yu8aFOAe6pgI7MbgHacktULhnBGCq+1wDKDNZvwnZ6jQ3fJi+9nzctCINdw/O
         WSwa8jP3XUHNK9q+lKOtd7deNTimBtIPhH3svuHxyxkzU9cdj2Rv04f6ZJNIJTYr9qsd
         Dw76v12d1Rji8Fr5U41+uJ1hwefXkKMNEm8nodQ90BvaHY/XynVd3zH2Dn7HNBYtrz/1
         1yn3CzgsfgX6Fw4Q08NeP4CwiZxHQRXFdwHzfQthn+SXPOQN8onCRe3+Qu82h1ZQtn3h
         R75g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353362; x=1771958162;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMrQyicAZEEqH/BJVyGmHveMn6L1dPKlkyYCF6REmA4=;
        b=AkKS/t+s/xZIeKKW2YuyamBSbOQEBPZtmUZ+LEx6UbbxyrAh0xe6YTXX3dXC4LsJmq
         4uQa4f3oDGHhWpdrzCP8RGHRpvmZzg/Ff3+juVJODfWOjWbgBQNJDS18MTNGpEyAup8/
         ZLfyESodM5MDkeUmJRlNSu6w3dTfXp8I8M1zjpYPngUs7R5n1NpPyB9I2cdaApvys8/r
         PVK8c5bscr18d5ZPYePdEz50xuL7DAlDWb+IxOklOZubB6u36QcYlD70QfrLD5A3gtSW
         T1LWFd8wbWRw9RZraFdxouYy0Uga1x0smzc9hbhZVso1KDNMIdf8u9SAUeG4KlLnZSlk
         pZnw==
X-Forwarded-Encrypted: i=1; AJvYcCVwEow6eQ74UvhbpCkw7rp+R9XIeU5STAeutRCdmyXDQ72AuXf1SzmxXvnlAPnHJB8ZnP0S/sBqoCAOL65Yp0A+@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd4OTA06FiBOOQ17stI+PsNHSm31K/7TDCEo4WbX9/SaJeVZ4c
	OLkw+UtBB9K0s/KQ1LVtvMKlUM0VWDCuNnQLIK2tFNjq5eFEkGSTn5DEyZiW+uGj0yo7TctEsu9
	iFG9/44MqIPkNfhLxZzRL1gBqlIEbSTdhmm3O+UyTwkGKTb7FMXNYkbpkuTvjN8Lh1EILfwsWJM
	x3xw==
X-Gm-Gg: AZuq6aKaoRm317ryIxf+ZxpMSsvOyM2qjjk5ogxFIMjwDQ95C7WllHlTXhxuu5SlFIE
	Qqu+bsCsDjW6NBeL2p4DdcHonTOPcFJKZXovlweAUxfGRfD59gcJkbzqSYUhlQHNyqrTEv6TBJc
	4dHIbvUQ/84awoGA5llVLs1yPZqMBe5jFZYtq+GDzty17YxnnV/JlPfy8iGKHR8JpMyIZBETJIh
	Xe+SjP9B05e5taqfFQYIPw4tRNwU6qu76fLse/DZhvuoMpdSR9RTNqcwPVEz1de9DH6SivVXEAR
	5gb0JA6j4rK6GG3NzSc/9DFjVBrxt2h683idBEL4BuFxOkECHeEOkLPsIE4GI1v2HPE526WdjKp
	5zAAvap8QEYQESGyCWdf3vWGM2Wb8OKLIIhU=
X-Received: by 2002:a05:6a00:808e:b0:81f:5037:a317 with SMTP id d2e1a72fcca58-824c5ea230bmr15684885b3a.11.1771353362505;
        Tue, 17 Feb 2026 10:36:02 -0800 (PST)
X-Received: by 2002:a05:6a00:808e:b0:81f:5037:a317 with SMTP id d2e1a72fcca58-824c5ea230bmr15684842b3a.11.1771353361950;
        Tue, 17 Feb 2026 10:36:01 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-824c6b69b13sm13401027b3a.30.2026.02.17.10.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:36:01 -0800 (PST)
Date: Wed, 18 Feb 2026 00:05:54 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
        imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Sascha Hauer <s.hauer@pengutronix.de>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next 3/9] net: stmmac: qcom-ethqos: change
 ethqos_configure*() to return void
Message-ID: <aZS1CigRWTH12scL@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKP6-000000093mN-1IDF@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKP6-000000093mN-1IDF@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=Coyys34D c=1 sm=1 tr=0 ts=6994b514 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=OS3fFONSsTUfBaauNq0A:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-GUID: WAjqrkwVXOGLDqiUyDpOWDDwcs06idSR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MiBTYWx0ZWRfX5vATGV1CXThg
 fXGJGb+bcICeagUdZw5qO04Hb56trJnzI2yUenONslSOU4bdp9QTHxQ5lIsfCrZlDuV0YpQJEYu
 gqOdMxZK86dRuPgo5lIpy01+acVYnJ6l7E6qNbnkonjLw3fvg/xlZWhWE3a8RyD8yKIOy4hzmdb
 vhzD7Pn0Xpq8+zPvX55ZvSiYzQZMJzyc5AzELAai+G7JidZd+k10LeOWnaeHoy9FjZnh8WXQMSJ
 Hr61yUwn+Q2MEMvQ77dtyyR83PwUg+xH0jRu0mHMGaGKexPExDJDnMXeBpJWQ/nynvYBlOvSPOb
 UlYMfhBR4Z7xxL2lKNU+CjrBpiXJJbid7cNP7Uw2Zei+7SJVLK9s2SSUaHhLbv92ftp6wkhoPma
 YiUYWvmB0XTvKCb9gtr2aLldv1/44v8OqCU+Q2pMzJj+zLYq5rEsYGh1x+MwyZxM/3Zf0ILiiRy
 AUW+jgbi5YiggOYUvIA==
X-Proofpoint-ORIG-GUID: WAjqrkwVXOGLDqiUyDpOWDDwcs06idSR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170152
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_103604_721539_EFA296E9 
X-CRM114-Status: GOOD (  12.59  )
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

On Thu, Feb 12, 2026 at 12:17:56AM +0000, Russell King (Oracle) wrote:
> The ethqos_configure*() family of functions always return zero, and the
> return value is never checked. Change the int return type to void.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

