Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A31B5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 11:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+cD/qdB4qLo7t24V1HoY2mhI5/c5P8R7KcWgHdIvodg=; b=MaDv7vasqr++WVm5AzpUj7NQFp
	2nmmVf8ED0khcYwx87WGyZqlDMqtbIIwDeq+nOaU7SY8vdxqNlHMooBnq0kFjjTgw8sVor8eTQT6E
	mEYOI7PkEGHvuzZV1CcT3bszCuKhyRCRoKLAECJNmiOBsnwVvdZLpDysnJgOORs87Hjuz2dPhbTO4
	qotYQznqMrCk5QDBHYngwTXoCAga5tuihDhRBTur7sm2PjwM5dlfM7f6hTuTmKLHmfV/S6Kimah1p
	Ff1r3pcAhWSIu0bhz2h7cs2Rk5hE9LLep5V201Blfnt7cformzyJ0FN9XhO3nX8rfB1m8gTouCpAx
	FFuxikeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWeC-0000000GqXj-0C5x;
	Tue, 30 Jun 2026 11:29:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weWe8-0000000GqWH-3XNi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 11:28:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9mx761613472
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 11:28:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+cD/qdB4qLo7t24V1HoY2mhI5/c5P8R7KcWgHdIvodg=; b=jIvI+h5dau62FnVJ
	+ceUeR3pIvghdyQb72ZrWn3ExB2KV7pko6NOewt0MuaLC/5682f/9U1HBRyDNClc
	vfOcsbkdj3QXDxc2KG2XS1eS/6v7KGkb3JTZNhjD38868jBp8OHdT93MZjshhmCJ
	cx3H2Qeu3/rn7o1/DCJBIPFSINj+JKiPfQpNA5jNOV+7T5oSB1mXlinNSrV6RouU
	mR1RkgGKjlZRVAkiHJ/kBjSagsQ5/21TU8QDKwZhUrnDJ32D/A659lCfYmribO4q
	q0afVARwI8CHWCAtX2IrJYXZqTvPX/LeQMLj9nZe7oYC317TBUYpjm7Gocq3ebhO
	sMu58Q==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3x1cukja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 11:28:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ca3374c6aso11886678eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 04:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782818935; x=1783423735; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+cD/qdB4qLo7t24V1HoY2mhI5/c5P8R7KcWgHdIvodg=;
        b=RoXZbhMucFrw++mSp8CU/khuC+SKmtflLR9yN13tUminqXT2xgShfGFdm6P4UnpOup
         j5mu/F/KYGHcrZdc+jozVP9O9ABsKHiNg4p4g332iNMAYaolXs8IxmpCuHfpXb8z9Dqs
         n8oB9KuehzyIso4Op4OoAOHPzSAHSRQXxPcLuVaYeOOkBtH6IW5/19zlSVg1uou3C3az
         MksBvU0nHAkEtOKnF+2FVI1VZITwnzkAywaq+T/Gea8KvcusQlZaj8BQPb4AO4lhuFp4
         /LyhitPPki2MuzWhrT+A4xPVJinclVqD2ajy0++rficnL7YjVvp/cNStPrDpAwCjxRG6
         AgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782818935; x=1783423735;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+cD/qdB4qLo7t24V1HoY2mhI5/c5P8R7KcWgHdIvodg=;
        b=NlYFdTJx7CmiACOuIEoj3hkUBnYP+Pv7xdAojZmNWqc7dw/AdrSu5OUjU4OhDYNvaQ
         awc1onBmBYFtNpoUKa/oP5aAkBfvahD65VxlAsldoc9VQwOS880jFE6wylRAXNfE6Sd8
         MqaO8PiHa5EUk1SdywcNZgbQJJiNfyAD5R4Ftlce0Ct0eShSDkY9Vxje6YJ5EJRMCFiD
         LrEuyttLlJBZ90L/3bNQXYbbZnS5JQBZy9y97qGLEI5xqe5srwWvrIlsZlzlHW73BwbS
         Exec7XAJ6GYFuwcOZgo4c63MUA1qeIqI4IzmBfqv/gElyMCUBt+v9jTJiaiXEpb0IjHm
         tKRA==
X-Forwarded-Encrypted: i=1; AHgh+RpNE/DMzZcqBslxE1T1hyGIBs63xaIo5yj71ABPrheCaYyHjjvdyYstWxwng0ooZOtllQRpTU/sNv2jQuvh1xuU@lists.infradead.org
X-Gm-Message-State: AOJu0YwqMNgo+bMqc58a2WVnBXgArYrFa9pseZ7XIKLOPk9xDe1/6paW
	v7hY4R3kMoq4x6eBDR+e0bfNO5EM1Pfibm1r7YNkZ0ge46sZ8qStRZ4Di27O91CJ/Z0UF6iaTaY
	LictaQbpg9JS0f+bH4aqb+dfqx6jgCt1QUogQBX+FYFR93ydCIMGWK76ZeF6tKBgJhVNJnkqjDJ
	naXg==
X-Gm-Gg: AfdE7cnk1GlU68OUgEK3cPBKH9p7lfSwRH/WJVoy1i01QiKVwNi+0lL/uY20b1CIVNy
	X4jexe0H/5eRA7IbdHfsDVEpZ78VJDJPV102/LQxAopOUuVJJCg9tMSl6bU2EZOJJqMIUy37bY+
	VtXc3s8g/11kLKGzR0q826S2L/7RBIT+b+cC+bFot9AEJseLQyIij50miCWl4zOB5FSdN1Lv4c8
	0+4caANiYA7d1sb4XfagpR67/ptfIXtpzDvbexnpJAXINJQ+6T6vnblt+NPPyr4UTireJVXMs/5
	htNsBzjHcDQTVAvhC9cti8QhaNo46pFQ5gRTgFLfdNeKAhZNNo91b/h4SO5QPYFTR2aRqQJIA1E
	W0I6fqmAFAVJxSDhHChKuDwwCHIXX
X-Received: by 2002:a05:7300:4303:b0:30b:ab02:9e52 with SMTP id 5a478bee46e88-30ee13d61demr2319263eec.30.1782818934566;
        Tue, 30 Jun 2026 04:28:54 -0700 (PDT)
X-Received: by 2002:a05:7300:4303:b0:30b:ab02:9e52 with SMTP id 5a478bee46e88-30ee13d61demr2319229eec.30.1782818934035;
        Tue, 30 Jun 2026 04:28:54 -0700 (PDT)
Received: from QCOM-IvKeorbwK5.na.qualcomm.com ([120.56.202.7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3264f52sm7541784eec.28.2026.06.30.04.28.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 04:28:53 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
X-Google-Original-From: Manivannan Sadhasivam <mani@kernel.org>
To: Yue Wang <yue.wang@Amlogic.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Remi Pommarel <repk@triplefau.lt>,
        Ronald Claveau <linux-kernel-dev@aliel.fr>
Cc: linux-pci@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260616-fix-meson-pcie-reset-gpio-v1-1-fca404b4c8be@aliel.fr>
References: <20260616-fix-meson-pcie-reset-gpio-v1-1-fca404b4c8be@aliel.fr>
Subject: Re: [PATCH] PCI: dwc: meson: Fix reset GPIO initial state
Message-Id: <178281892763.291682.17352622719357029190.b4-ty@b4>
Date: Tue, 30 Jun 2026 13:28:47 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDEwNSBTYWx0ZWRfX7W5OIuxi6vG1
 EUkgl2HAOsH4EolZwV/dhfykvNXwOKlobcZr4PwrvhGlWoOnvzuy6PQyo2dvQcbDTAElv/Hp+Eg
 VetmNSmS0lPh+/fVul7PIMjDyPwR4KsdlQFcqT5LFEC9rcPg1rxrVXkt88H19Yw2vG3Vrpm4BK8
 BjfrYNoN6M9as1Zm/+bVGj8ttY54tUXw8i8CqsGqAgLJUNbUovOaOjDDjBwnspL8QfL7E4rdBX2
 rqRxwRGGuBxpyEVRHpDFNFFuANHNk2Z7IAo4Vf1OGKpeqTV3fHRQahxyx9aTuBoMew725fp7EWV
 VDydwORqxvbKjt7ZIOBtVuBWcrrYGamorTrKKbruNDzTNqEU+4rgPumSr381JHexrv/BNiAmjIU
 VyyJ7HT/ZgzeUqTGjJMfvHVrLYJJ7mRZzIj/l8OdK5/C/r55cxAvr6qY9swicLlibhUYuRcBRF9
 w7EdXioJyg7DUQtVHBQ==
X-Proofpoint-ORIG-GUID: n0ZoHstlrS5MzydqnkNW5k3YAE0dioSa
X-Proofpoint-GUID: n0ZoHstlrS5MzydqnkNW5k3YAE0dioSa
X-Authority-Analysis: v=2.4 cv=ftfsol4f c=1 sm=1 tr=0 ts=6a43a877 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=d0NiXODO0fVjScRmrPHHeg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=NGquYU0cblXHf0KasdsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDEwNSBTYWx0ZWRfX777heJe3ifh7
 55mgojFuJ00i1XpK8zI+C8DQi9V6Iu2MLS5Nq+ueYMwuI2tWUkcGWbMGVS5ns2bLtpir1F+8ROW
 6uRCQPvMLsCERNWox7OnH9HV9e5Cz2A=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300105
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_042857_007263_4996A3AA 
X-CRM114-Status: GOOD (  11.33  )
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


On Tue, 16 Jun 2026 09:07:25 +0200, Ronald Claveau wrote:
> Commit 4d3186a525b3 ("PCI: amlogic: Fix reset assertion via gpio
> descriptor") inverted the reset assertion logic to use proper gpio
> descriptor semantics, and moved the polarity configuration to the
> device tree as GPIO_ACTIVE_LOW. However, the initial GPIO state
> "GPIOD_OUT_LOW" was not updated accordingly.
> 
> Change GPIOD_OUT_LOW to GPIOD_OUT_HIGH to get the right behaviour.
> 
> [...]

Applied, thanks!

[1/1] PCI: dwc: meson: Fix reset GPIO initial state
      commit: 702c89eec25a10932bed074cb9adf0fcfcb6652c

Best regards,
-- 
மணிவண்ணன் சதாசிவம்



