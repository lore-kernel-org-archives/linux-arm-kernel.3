Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9510D2D8D4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 10:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eLg8lvRXM1ve1El07YMeIhnVb/G8HJbWmSDSOLjgNQ=; b=jgyIkYtdSzszDtu23lLSJ230x5
	I944zWmpJreJUpOU6vgFvpvk1SWLziTkClnoLYY/2CJjr+ghjIMfDUOfwwzIxoaZl53emwiHgodw1
	WZblm41iTBNzNshVcxFq9epeNHvYh9XFEMoNVNvBuJSSQwkbm+PBH/+qZ+MgNdUz7kUqEOyE4Qm1r
	bSrJRpT39mAJf+txmAtzpBhAenqGYVEJjGgS9OZgF105BVfNG9FMuq2U3s4VdQ1WKPOeMtElHjrCQ
	Yy+FoGAvmP1WY/QB8glwlbaQCnG+ymuhXh5qWA8oJtO4OKpRsnKeUAjFl8qaf8xaC1KOtK6JWpuYF
	Krefd/Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkg9m-0000000E2K6-1ekn;
	Tue, 27 Jan 2026 10:18:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkg9j-0000000E2JV-18ju
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 10:18:44 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60R4UEod3714726
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5eLg8lvRXM1ve1El07YMeIhnVb/G8HJbWmSDSOLjgNQ=; b=EhCfTHkSCCqEqT8v
	sxtTfUo+UdFqN/R/lNeTo8eqz2G38XLCerWbKQ7ON7NIdO5Cnwj8aAXD07eUQPGG
	veO8iSgaJnEjkBro1hmTg7akNiFXYaQvy1hqsFgCa8Am+tETWL7SuDqwSena/8c4
	JaiMiMs95qSO2RJstGb5r5tgwfLerdR+iRE0bR/cYzB5yoSfKQ+8W8R/WnIHfqNe
	T1+Wvj9oqNZMdiKLX8fPCjk8zcMAZBBmdUqD/g9UbzIUpu+4KmPgfIY/FhQ8p4aZ
	BRW0QJRCyQOga9Y/tm6CjOv4IyAHfO9o373CAf4ATWc7kHtWVUCrgKk4mmHEzmpl
	klcG2g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxdv0akp0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 10:18:42 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5029b0c3786so156690171cf.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 02:18:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769509121; x=1770113921; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5eLg8lvRXM1ve1El07YMeIhnVb/G8HJbWmSDSOLjgNQ=;
        b=VOwWmYomDf/syq94Bii2BnrMx7FCFMJQ0ieiN8IudVAGxZLzGQjYIBPlzEmmZuxiDJ
         vrtTX213dk1KhSlB3wP4gQXVnV/7f9Fnf4R8eOr2eW5M4cyXPFtI+OlpWnKFOUs7ZUJA
         6bfCg5+8VXjJKzxnDs2F2SBTD04GTi26hsWod84YXuAdg3a7xrS1P/uV3H3WIQ63Jgxq
         YcogA4RHI6fm/NOwpMP1dt2U8l1qW+oftMIVn8DQv7fdCur83zB6ZGi8zBLGixF+ITBw
         4y6goroteSWf/QTxR36x1teJrV+BhxdoKZzYOiJwHkbs8LE/HGmOn8hU2Z/LrkHuW1TV
         sydQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769509121; x=1770113921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5eLg8lvRXM1ve1El07YMeIhnVb/G8HJbWmSDSOLjgNQ=;
        b=OzPQpANK9S441xqijUsxuh1ZdXOz0VmIDvJSBxSwMHlwWUi/1yEgHfJFAL/H+ZDCK9
         2EqLtMMXeTvRDxAbW3LKFWa0GxCmIrJn2ft8z/XapYhFd6pWDzJePtdH3iiTjiVijwQK
         uRQDWoebxQU73Hdqv64I7P0q3IaVO3MbygKcKTBSKZPGTbXe8UyiEqNkYo0eW9p3vmYN
         d2w+PVODB4l1ReXAOeUA06XNcQ3W2/HIbbjk2WuCyGsYRZcCsDd1mCAXgdY8Fi8Naam1
         9cgfS7V4P2+UdH/9wyxWsL2krSrrGNa0liirwadXgyquZFRyFnKroISz+FJRbP/mpFM5
         J3pw==
X-Forwarded-Encrypted: i=1; AJvYcCXh5NuqYkvd+uHUsBklrkEN3McoHBSmNd16cFYT8daWoY7DGNCpGNxQIzw/p9EMgmPIc5ZfzEWFtXSoE7bxpFNH@lists.infradead.org
X-Gm-Message-State: AOJu0Yxos5Ddbjq0K1Z0pOZ43kzx3HECEOPWdL7I8nnN0Cp9im5hoq/G
	igDFEb1quEHFIHFmt7sKCidkWTNXRPIYXeL81m6m1w+2+w2X8j8gJjy5qnX4vrlnnpXf6avUS0/
	5nHHZg2aEWjcxGQl3wCWc7x2AUbZJ33Kw11TgT0rC8iJ/eOm5hb22WsnkUxuQ1XCC55bBzwqaAL
	GNUA==
X-Gm-Gg: AZuq6aK7xYmQLGVKNKk7+8iDXJ9k3ot6p75q6DM0zmPTa8q3wVYOPhBmNtkXTAbvgPa
	7XGSMqRHFXlsMJ6jjcCPNNuHuaVzq7nRKXPzLJMp0pY+1kw0e/aIr3OdjNFd9N1b6ldKOj7yeBO
	BDpsPN58PS0m5qh0AllYi095zBjiTOWeQ8HWiquzy5pwNi2VZYA8r/SfftBV/S+3ULyw936PloM
	IPWjv2h84y1fUJlOdtUpK0IwR42z2lIeI4pamoBoKaasui1ONubbU7BWRuPgrcM7Z+vPSey57QC
	RD3dBtn1U/VjA5jkaEBqmg/aspKOe1YucqhjQSKexgMz1wmQwzDPRdTVpn+1ia4WDgcD84WYnc4
	8DxF6bkXWz51HdTImlbQxpVnmfcOwj3/tvBefiA==
X-Received: by 2002:a05:620a:4046:b0:8c5:2dbc:623e with SMTP id af79cd13be357-8c70b8cfd23mr138533085a.50.1769509121415;
        Tue, 27 Jan 2026 02:18:41 -0800 (PST)
X-Received: by 2002:a05:620a:4046:b0:8c5:2dbc:623e with SMTP id af79cd13be357-8c70b8cfd23mr138530785a.50.1769509120943;
        Tue, 27 Jan 2026 02:18:40 -0800 (PST)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:262e:d32a:e347:8b74])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804db7b434sm129589805e9.4.2026.01.27.02.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 02:18:39 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@codeconstruct.com.au>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        bmc-sw@aspeedtech.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/6] Add Aspeed G7 sgpio support
Date: Tue, 27 Jan 2026 11:18:37 +0100
Message-ID: <176950911309.20207.17767153546829205311.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
References: <20260123-upstream_sgpio-v2-0-69cfd1631400@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: S1YodPROo7lBFQpm3EfkbeBeCam25SCl
X-Authority-Analysis: v=2.4 cv=SvedKfO0 c=1 sm=1 tr=0 ts=69789102 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=oD6QKIyjnqh-ffyw0PwA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: S1YodPROo7lBFQpm3EfkbeBeCam25SCl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA4NCBTYWx0ZWRfX7iTD+2uBA7BL
 L7JxTEINdR4Z2E0RO8GQ5cgPPVkAkH6o9KJWZm4C5zpWRz7lJyxvqlk/UmzoPmMpbt20CQLczOk
 PCo29FYy3P2V3rYL2u6w5cvgY/25imqA0WmvQ/uV/Zs/qKvgJoctD3rS1+LjGWy4xgSgnPX4AmS
 ZKyqZXbyrX9jOzQIa1poJgCCYkp+iVxIC9SVuZxsb9/Ymm+f1xy/+yiUD2o4jY3vs2LZS2H6N+R
 g9gNiw0no1HpdQgfDNsJ5wfj5nOmFZa1blvog31iNcTwld+pnI/mz+Pm+k+yN4DzMkX2WNZGlBf
 q9pl1PGul0A3v+IVz9bRLrzh3QDFIVaatQaA929lAGheBexRsoirI0m1y920s3VeHFjHdEDww0C
 ZS9fntQIJkz9UFOnr5+PmXSHd9Gn+8gZN5Zx4/ja4tOHoGMx5A4sDVYNXYIGTPoQe6r0UUanVjD
 tlSNGfowuUxnVyWqQjA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601270084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_021843_463162_618C4C53 
X-CRM114-Status: GOOD (  16.30  )
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


On Fri, 23 Jan 2026 17:26:25 +0800, Billy Tsai wrote:
> The Aspeed 7th generation SoC features two SGPIO master controllers: both
> with 256 serial inputs and outputs. The main difference from the previous
> generation is that the control logic has been updated to support
> per-pin control, allowing each pin to have its own 32-bit register for
> configuring value, interrupt type, and more.
> This patch serial also add low-level operations (llops) to abstract the
> register access for SGPIO registers making it easier to extend the driver
> to support different hardware register layouts.
> 
> [...]

Applied, thanks!

[1/6] gpio: aspeed-sgpio: Change the macro to support deferred probe
      commit: e18533b023ec7a33488bcf33140ce69bbba2894f
[2/6] gpio: aspeed-sgpio: Remove unused bank name field
      commit: 5928e0d1f66112b49869c83ed8f1cc9db3df69e5
[3/6] gpio: aspeed-sgpio: Create llops to handle hardware access
      commit: a3d37e0cccf530a1bad377b3503d6af757f532c4
[4/6] gpio: aspeed-sgpio: Convert IRQ functions to use llops callbacks
      commit: 43090d6993341b977ca66f4c72e776e99f7ba996
[5/6] dt-bindings: gpio: aspeed,sgpio: Support ast2700
      commit: 149470018e678b8fd62225c01be67ce2f9b5b1f2
[6/6] gpio: aspeed-sgpio: Support G7 Aspeed sgpiom controller
      commit: 274ea0f1687a849ded4f92d10e4c0e77f37740c9

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

