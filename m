Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB4C3E9A031
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 18:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=whCFM/BSXgDYxgAJq7FXzzvOBcHA3JZlYE1RiqYzwa0=; b=4046dnyxouUllsO68OYiqDR5AM
	CoP+X59YRPeKMSGoUSEt6AVizqPQO2UjFQTTRX4IAFHYPkwBqwn8acDYjHtiobsQFysCNdb65Smt3
	+VutxHOZ9WDpKPODzOEog+JBnI3xJlxCQ9la1LZ97e+N6iHH44YVstJ1QdRepblXPYjs+rfrb6fLG
	hDUCATSMFRquS2uG1nfZsv3o8FHyjF5K7oyP25lJl/aDvp/6UNNdd681s12puORqMzdVHdCjCjHvm
	rSwikQqUb/Wg2vZX4d3EApuM+5DyPgGTSd4vNV8/klJvHI+2SDGOyCnsEsy1iOX1B2HKprlJDG7eq
	QHs4L85Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPuk-00000008j9F-098L;
	Tue, 17 Feb 2026 18:35:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsPug-00000008j8F-0WWi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 18:35:11 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HBEmHx850080
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:35:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=whCFM/BSXgDYxgAJq7FXzzvO
	BcHA3JZlYE1RiqYzwa0=; b=RDgF3v2wzcsLhhMnH8jJtVlwHjzy/EmJS8YH71Tp
	knkpCG1Zd1yevXd10FcYSMEOEq2LtaMVSWqlWjGFlsZDZePz7mYyemc9eXkRQPAn
	OrRoeWRnSadtiHSvmEVEZAzhVmhC8bCQfZiGu3CIKGaKUG4lqLu1ZED0R4XpqubW
	035XsnUYSPWYNpS4mGmrj4KLyepupzJ6tBOuh7T+z0sPIXhr20EwdflWj/sdY2I2
	t+TeyoPQzbqkJRbueblz5w+iaXG9OawdWvbVW/Nqwh58LaPZ+vcWJDJqVT03J07D
	TL/knQp3vOUmSTureJz+tpOZLkSCpScafXm9cI9QUq4b/A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc6nrufpj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 18:35:08 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ab0b2e804cso55417465ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 17 Feb 2026 10:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771353308; x=1771958108; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=whCFM/BSXgDYxgAJq7FXzzvOBcHA3JZlYE1RiqYzwa0=;
        b=JoU5fxUu4wdv9sCQzYVn3KUj5Qsj1/4G6nfpO4QA0mz9ZWVREm98Jj4E3hKOnKG0vp
         TT0/QKEYoQUR4MZsAyPZTlgorUkGLtyzzUXNB1zuY7uuMd541Ah/Bgr3YsLpP2fHHJxM
         jFnoXucAawd67hE8fs/3QcE/1rkSWywNtSvvTWa+MtPnHOnupJegBTH7kUczQcAehe5I
         rRVi/oBG7PqsBCrVrICwM5ec88moIoZRG7v0lx5eiI9oRUlroPw8UbAoaaul1MA5t5Z7
         48CJmO+0Dai0HtoFOcp1dqZj65vHcUNs5Qa6LNmTDrWKmTVVtWEGTbD9OpZ/P9W3ihk/
         rDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771353308; x=1771958108;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=whCFM/BSXgDYxgAJq7FXzzvOBcHA3JZlYE1RiqYzwa0=;
        b=go4leNHqsQWthrUPk4bmaBy81+/AEcqlA0mB9qKacObwvql+PZuncQjOCiHbXIdorV
         7SosrrDXXMndLA6j5tYNBRIvZ/me2qB0GkGlRJPgGPl6AyPyc6KkZK8ilEvlxwUYYDqG
         hhn4JoPVxIj3tozU/Acrz35NvIeHQDWrAsguJuc/1aq4PSBfpa3SVpNnReNKsaMJ51VO
         lCkfYB3vuYEB6QbrXt3nwhPrSrSUzpW5y+sIWJrhRATP9Dq5SvYMfPEiK7pHECSSxvwu
         KuY7YiB5dC3x9fw9v59IN1L1XhzV8WLWpTh9YZpZI91UfWpGX6IzNcejXtGXeOuHbXdd
         smbw==
X-Forwarded-Encrypted: i=1; AJvYcCUFTjtqrFFEhNrKfM/LVyMWcvuIDw0bOTyCD06ggDs9w6M3Nud88QI+H7vT3CRd8PV0qCZwdOGR1UcLOmiGXr60@lists.infradead.org
X-Gm-Message-State: AOJu0YzAO4vyVh2QLnQFUAGJFZmHmqFsA+QtEg5qecuoELM+99yhXxNF
	ODL1oR81YlxanU509PSMYHVgteLYWVDCyBqKJzOn5FgWSyKRlRpoT3EjUv13YbWLlL+UiLOyGSx
	hi2LHeOYBwVIi5aYg2KJoavDeppD7UPPIpu0NNr9TrGTJl4z1kiLPALvGGxRB4RdJV+ofh7AVFz
	W0eg==
X-Gm-Gg: AZuq6aJ+qeGYX+c6sJvfaD5SKyUio4z7RF4BOZY2hryb2GhvPYqeeVBlhXS1lpgYTKp
	KdF510XrIHmmlTqRJJTVLydPnTnA6rteUiAmyyxzPpsTzBdCbH5DWF8XdFlFzmV+smgu77QUqkv
	bb9Ur2kZQ1/6kTvEP392iAOEEGJSgiRxAxSjWEsHAz5qPy6LtCv2D3RwqjuIyH46cuHGSFZKHhB
	opKiQno7ceT1s2sgSOgYXLKHimunEi46s7PELirM+qqTm1bxcsCS0I8NL/yPSgr6gjNONKjQ8yo
	5NRqD0azdUiSezhsYnjuPgVIpJnkPgP2ESlEFmLHq+F5/k+DcHWnj4sLvKwR4JTdftTsQ0SmRJi
	m9YI95RT6129mb1XGlK+Twx/mY/7pr9Ne7p0=
X-Received: by 2002:a17:903:1a44:b0:2a9:62f1:3fbb with SMTP id d9443c01a7336-2ab505b61bbmr154642415ad.37.1771353307775;
        Tue, 17 Feb 2026 10:35:07 -0800 (PST)
X-Received: by 2002:a17:903:1a44:b0:2a9:62f1:3fbb with SMTP id d9443c01a7336-2ab505b61bbmr154642075ad.37.1771353307166;
        Tue, 17 Feb 2026 10:35:07 -0800 (PST)
Received: from oss.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad1a713d5dsm180261815ad.29.2026.02.17.10.35.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 10:35:06 -0800 (PST)
Date: Wed, 18 Feb 2026 00:05:00 +0530
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
Subject: Re: [PATCH RFC net-next 2/9] net: stmmac: qcom-ethqos: remove
 register field value obfuscations
Message-ID: <aZS01CotaSazpWvD@oss.qualcomm.com>
References: <aY0aJppQWUC52OUq@shell.armlinux.org.uk>
 <E1vqKP1-000000093mH-0Sqo@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vqKP1-000000093mH-0Sqo@rmk-PC.armlinux.org.uk>
X-Authority-Analysis: v=2.4 cv=XKo9iAhE c=1 sm=1 tr=0 ts=6994b4dc cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=PHq6YzTAAAAA:8 a=EUspDBNiAAAA:8 a=eMU2cjtvKFU-KvXMnqsA:9 a=CjuIK1q_8ugA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=ZKzU8r6zoKMcqsNulkmm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE1MSBTYWx0ZWRfX76eGpwHEQb9I
 1bEFtY7D4gL40VpGKUuPgbn3iJa0ZDyL4zxykULM6UhPaICv3EflB4v8+gcPCFRB8n5zUzTXk+j
 OSJ/09YQhgCahNY6asSnGuTlOCditxmRzpb/Pe1ZBZ6H2uzEyD/A0UDL7jyZTRHWvNSNHqmka7H
 adJu83edmcLHeQpSrBlCYn/fo2YEeRZeI3ZHwc5FDTuPh/IOHosx0VBjlOz52HXZFF2zz/wI9d7
 g9TgyxL5MdqDNLTCACRrH1RtAhUMJsBXCLJQEFJ8819cfJDFI+33yem52JWv2RzD4HYgKLjE20I
 tP8ZCeh64Tpw2SgNHrr8djvEDK+l9m9tj9M5nkJWsTxr+y43uMfobBqdM/Thq202/qG7EFTX+ga
 uKKOsjRI8cH/s0iSCLjbRSK1/K10RlTm95zTLpg5qVA87cqr/YpqzFGQpxgDDTY+z2W665rch1U
 M5Yyhg9C6HxFWeJv/ug==
X-Proofpoint-ORIG-GUID: K41s5e4DD1N7n1PD9nKm-MbuqV_FzuW3
X-Proofpoint-GUID: K41s5e4DD1N7n1PD9nKm-MbuqV_FzuW3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_103510_281724_92C18082 
X-CRM114-Status: GOOD (  16.76  )
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

On Thu, Feb 12, 2026 at 12:17:51AM +0000, Russell King (Oracle) wrote:
> Convert the register field values to something more human readable.
> 
> For example, using (BIT(29) | BIT(27)) to update a register field that
> consists of bits 29:27 is an obfuscated way of writing decimal 5 for
> this field. The comment above needs to explain that this value is 5.
> 
> Worse still is BIT(12) | GENMASK(9, 8), which is used to hide the
> decimal value 19 for the bitfield 16:8.
> 
> Fix these, and a few others by using FIELD_PREP(). While it means we
> have bare numeric constants, this is more preferable than having the
> obfuscation.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>

	Ayaan

