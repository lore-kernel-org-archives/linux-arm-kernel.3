Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E66BF3C246
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Mar 2026 12:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rTeDok56LaLfDQuOKEeyhxvTasa4vMf5dB210aMR+zw=; b=uhiMZoJx/cr95OBV4faKvbO7cI
	l6LhUYiS1NvNvNxNd164GzKNVXt6XkAe7a7jqxJneR+3FYJTy0IyCD0stLZLHmwyG6A+6qa+3feqg
	ACX3qJLOyXj/2FhPKkiMQ9wppayW4oJvQa2FMGvWav0glnFtDgUf5BQ/6AoQw0aABTmMrhCDV/MUQ
	9cPuWAuXe4mlwBry+OUk/YgKikLAiGuK0P+Lcz+oFp6hjzgzZDdMxh34xbTWzeRJhuvtCdoWhiZhm
	jOxd+pmwyak5Z17s3C6vQj0Gwpl7YlXisCFxbwTYIXME2eMgfiEmzVPaTGIKDdm9ACC945977QFsJ
	qfX4uS8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZhP-00000007JNy-00BV;
	Mon, 09 Mar 2026 12:27:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzZhM-00000007JNc-1D5L
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Mar 2026 12:27:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6298W9ab3773088
	for <linux-arm-kernel@lists.infradead.org>; Mon, 9 Mar 2026 12:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rTeDok56LaLfDQuOKEeyhxvT
	asa4vMf5dB210aMR+zw=; b=oXZi76l39P4j9Nrm28AcHNcmVO6jQ/URLpNfbsky
	RDe4ewVm0fu1BfayaHIlA7XjnRvmDP5OqdUbkNM/cC+OTKMfwbUPFt6KlWtfUZcw
	CMqooEO8u9zzOZLY7b5YzVDv90S68eqzO2vSBYVBm7dt5V/tB+lg/nO9q5g8QPO4
	t3DUq29qFjDwbLA1mZOjZruhEG9LajgCo4l/I5cmPxNKk4RCNGO27jIfxbeWvdre
	M7SSYEewtsVtmDXOZ9xKrbfkqjbZ0mU5eCoUv0kuPUvuh/a1b/riTQQ/MA9WyV1t
	vIgJVxx9G30zXya+Fu2uBfKAxP/SSeAIPVtpBNyc8SJCag==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cstsa8t3g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 12:26:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ae415b68b1so98604855ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Mar 2026 05:26:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773059218; x=1773664018; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rTeDok56LaLfDQuOKEeyhxvTasa4vMf5dB210aMR+zw=;
        b=chQXZqNi3L+ApAjn3RkomhC7GlxJW/HsumNx7t2cPPKNPUWtAH0BDWiUEpmDcnPrpV
         armfOSNdICcWxW64r+ow/83pjrYTYiTxFb787ruaSFV8pTfp1qJ1D2pI3YYMmsr9/XMV
         6i2z+07ALIdCwq2I6ANf++Dk1mdUFQjgnwLSTlpK0gXafAu7E1ODbqtRFC/7oCvtIVj3
         qDCOmcpHAlSbIOwQK9ULEJ9RFevSSXqBJWk52yxXjN7HCO0ulmsXgeUP4OBpib6w1nZU
         /989Wt6GPJ+YcCS9mscx2X//ONrip8fuyCyyoQuNIJEK/zSa1GwH96KSjm3GfYadDceO
         KO9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773059218; x=1773664018;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTeDok56LaLfDQuOKEeyhxvTasa4vMf5dB210aMR+zw=;
        b=b1ajL/o+vVJ9Dh9GCVSLdU+z41qjtfazAr90VUmgWFvCjECrDH5/ljv7llPn3XadzA
         RdSPwhvybKi7NPS+db7J1NQcY23GsdrZosDgb+IMCYhhr6fN0hH3Dfl4NKP7mKFwZGX4
         SD2hz72wsuCmhTHvJh/3hbaeWWY68v7Ww6wp4XMdBr0rl26uHlBJEfHcQBNJzs95Vhvx
         E1Fs+q+nRb9aB9LNipKmnLf87eIfauK0agQZlrZp4/dIJpkB48Gep1l0MxRbeKYEfHlH
         mhxQ5cG0NMX7aYtZHzIwHO14JPolwa5zeOJcVWIfmTTIIy+SAvqJBXH9Pr0SbnwS3IwD
         Wu3A==
X-Forwarded-Encrypted: i=1; AJvYcCXrOE4spk6G05Ug0xkkUQCXGiv7lRtBTR3+/XjDFpu3taoASQQRBTy7CA/gUjL0Q6Xom4JPc7Mq5MEtUB7XsY6R@lists.infradead.org
X-Gm-Message-State: AOJu0YySGw14boB9IG7iXUqvcHBe2uKwysslQHRndt7/ljocyzxF/vKq
	k5ingsRyo3lT8iWLGI3fade5L3GWfuMWhcHupiJ7cn2uX40zTU1erNcCFwAoEEExyDUuqyvGo6T
	wXsc34PQupvSWj7DkckfIPhx2Y0WuFW3IvsoQi9L66kJ95ZBHtO174e5M/ikGNidNHMjjVsvc0v
	9Nfg==
X-Gm-Gg: ATEYQzxCyd+j4oTEa0I9cNYyDse9Ya7+y8b/ZgXxmU5Yr5xDt+RyIOZsC0ZEeJlkVXb
	KQN3YIZT2uXgelrfSMbZUYVPdrS8AFsYaVK9ahGgMRywDfekEfBP7VmzEdftliFS9aqBWXhffAw
	YSSNYlRiPcQG/oCwHABcs8moitB56vVAKeDL24idWtZViL7V2Z8QGYDY1So+Q3zsT2Mjyd6MqLg
	YMbfcvfmo9Ic49ibjbPk3llh3lpJlv25SW1W/7CJrRwcCGCgcvQvBeSzyNwLZODrNfQJLWo6oyY
	BG+GHF2BBCS0KFyQLXf9hcbbORtm3/VLuNsp1vCYkTbiOuIY55bPpJ/eMiVwIvoymRNPEcyyWhZ
	FBziSwbGhxwOKGAR+3Uajz8w4yKoPDgkyoTE=
X-Received: by 2002:a17:902:f68f:b0:2ae:42ce:1e5a with SMTP id d9443c01a7336-2ae824b8437mr105759745ad.54.1773059217733;
        Mon, 09 Mar 2026 05:26:57 -0700 (PDT)
X-Received: by 2002:a17:902:f68f:b0:2ae:42ce:1e5a with SMTP id d9443c01a7336-2ae824b8437mr105759455ad.54.1773059217193;
        Mon, 09 Mar 2026 05:26:57 -0700 (PDT)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f751edsm154196825ad.50.2026.03.09.05.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:26:56 -0700 (PDT)
Date: Mon, 9 Mar 2026 17:56:50 +0530
From: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
        Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH RFC net-next v2 0/7] net: stmmac: improve PCS support
Message-ID: <aa68itP3mXx0WUNJ@oss.qualcomm.com>
References: <aafxqCvJ_XY4YbWw@shell.armlinux.org.uk>
 <aandp3FYSJbwoZxo@oss.qualcomm.com>
 <aatLjarGu_qdRkP2@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aatLjarGu_qdRkP2@shell.armlinux.org.uk>
X-Proofpoint-GUID: 8e2yv9lwHpq6aLe48IH0OFHQnjeZa4jg
X-Authority-Analysis: v=2.4 cv=I+Vohdgg c=1 sm=1 tr=0 ts=69aebc92 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=GKVA2r4k85XJU_JwPvIA:9 a=CjuIK1q_8ugA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA5MDExMyBTYWx0ZWRfX77q4FPrUm6O+
 +SbUJ9hESMnWQ1+x60ci9nj8lyFgMkru5O/OMX0FdmkhefMblZ9UI5X/ariq/So7R6kp+g5IAan
 YadlrXwVX3LgDtX19hTSQLU+arN+EhCqwEizy0vi2juGrFhRIGo7V1J80Wr84X/qKw6g3OYRAf0
 /Q+64/BG8yCx46HAxRJzBcY24ysjckDIKXUXl7iEb7Te+nB3s39uASI9Z2H3Gea1jDpS2L6oBRh
 V4hXlGYmQHJGh/cTEO5nYXEVjvpO8mRtxSBYgg7mgncV0GiD5EnQRClN63Ky5Gl/IVzbEZTVszh
 ipo2+Mnjk+3ezdbPHvIT30Qq7RnMYp4XBd+WHsEt8z+ofN4ocLgir7U4Q1CE8IV87Or4ITDaBfq
 M6bDeLA59PLdSHSTPs6291H/Lsw95UJOQl9Jq8PnZjgmG4pt6WkF5armlOKvW5I4I+bApy1bhnh
 87lf/SbmQbNAL5Y7gcA==
X-Proofpoint-ORIG-GUID: 8e2yv9lwHpq6aLe48IH0OFHQnjeZa4jg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-09_03,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603090113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_052700_468230_7F3DEB08 
X-CRM114-Status: GOOD (  26.00  )
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

On Fri, Mar 06, 2026 at 09:47:57PM +0000, Russell King (Oracle) wrote:
> Has it always taken a moment to stabilise? Note that the ANE changes
> will trigger a re-exchange of SGMII in-band, which is why you see
> the PCS link go down and back up after the "ANE 0->1" message.
> 
> I do notice:
> 
> 	qcom-ethqos 23040000.ethernet eth1: Timeout accessing MAC_VLAN_Tag_Filter
> 
> which is a symptom that a clock is missing. There's been some recent
> patches merged into net-next which changes this:
> 
> 2cd70e3968f5 net: stmmac: Defer VLAN HW configuration when interface is down
> bd7ad51253a7 net: stmmac: Fix VLAN HW state restore
> e38200e361cb net: stmmac: Improve double VLAN handling
> 35dfedce442c net: stmmac: Fix error handling in VLAN add and delete paths
> 
> please indicate whether you have these applied.

I don't have these applied. I was running these tests with my tree which
had the serdes patches. I will move to net-next now since those are
merged.

I should have done a better job of cleaning up the logs, the VLAN filter
timeout has been there since forever.

> That's currently expected, because phylink thinks we're using PHY
> mode (where it's in charge of reading the PHY and telling the MAC
> what's going on) rather than using inband. This is something that
> will need to be addressed later.

Understood.

> I think you added some debug between the logs that you've provided
> below, which I'll take as not significant.

Yes, please ignore them. I forgot to clean them up.

> This reprograms the vendor provisioning so that we use 2500BASE-X
> for 2.5G and SGMII for 1G and below with AN enabled. Note placing
> the PHY into low-power mode while doing this - this causes firmware
> to re-read when exiting low-power mode. I wonder if that's required
> in aqr_gen2_config_inband() - but that will cause the link to go
> down.
> 
> Note that VEND1_GLOBAL_CFG_AUTONEG_ENA enables inband signalling on
> the link.
> 
> With the above, you should be able to test various scenarios with
> the PHY - and changing your provisioned 10M configuration will likely
> get 10M speeds working.

I will pick up v3 and try this out if needed.
I am also going to test these changes on IQ9 with the QCA8081 PHY which
shouldn't have this issue.

Thanks!

	Ayaan

