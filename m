Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F53C624DA
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G6nUWKkYtFk4ALnCq1etgf1ghLbMCyTc495nhaOBwYw=; b=J4xO6wZt+U6I54TDQx63RL16qS
	AIsaSW2huYWWaeaM3M4Q037kRTF5t7/kJkW9zS4Lxu8KYShQSCaxvlYu5w30Zc3IKJrCucMWGsLoo
	zu9BnO3iYNUPwkvyRZLR/s5EpKdYKIsYLBW8nlL46FSWWmhBVMv4nxMkQfWqJflvDobbvDuzNwZ+E
	eCDzm0KbRaN5oIlNDco9gGQZbdko8dyI6Kj4rFLOHWiWraYUIcb2bYRnD5HLjorREKqq+HcsQ0624
	dEQoLjDUR6Yv+dtmMmeaTGMlpChXc98LZdn/odKL3GemsL4ABl03MVSMP+CPFYFRboItiy13xhz22
	DVCUkqEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24t4-0000000H795-0Zoh;
	Thu, 03 Sep 2026 10:41:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24t2-0000000H785-0F8V
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:41:41 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHEMN327166
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 10:41:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G6nUWKkYtFk4ALnCq1etgf1ghLbMCyTc495nhaOBwYw=; b=e1b8yLeIQuggebWD
	YqpVSGXwLusCv8DoR037i7QpLbf8cAhtvCLL8U57FMi5NI4efMWXGdgL6wq850TY
	g9aofQ5CZHR8Ve7G0V+oAYPZ0AduUUsQ4GQ8O1EtuC4VBTnbITCzulp3hR6PUCdK
	4BSBykN3xa/GR1fjMLj/KOfNkuwvT/CjMZmRgRC2qTCZLJcI+RyLjJCZ2mWUM/AS
	YYR1+3RxzXKIDsxkeGDuazI3fCi/JfEw1EhOju1nAhyMJ1kwRmb2Oxl6dvs+qRBI
	CHtMbfymMbCqkWhiPG+tn+l5lV0f457vo/6i9tWtsxwdiTueqiiIFhQH0e9aSYwu
	l27Crg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgtja-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:41:38 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-939062ecda9so325505585a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788432098; x=1789036898; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G6nUWKkYtFk4ALnCq1etgf1ghLbMCyTc495nhaOBwYw=;
        b=iVAbObjL7QeXxs3yjZgXx+9mtUeFtKOuhaSUC11CU9GhBYGIcz4bnPaMyzFjMBTmW9
         LIm1LZtYv8bShbfAu06krlDc1jt5b+N2Yj2nidocGTWrcYMku8kie6YVd1dTlxv2lHnL
         ZkePhhnyqS2Zr7Ok1f+/8p/P8YwYNIN9l3gD9a9kDppTc8i9TYVA7siR2nu9bzLHOh9l
         ULU8mw9QYWktIxAOmy/tAc6eNjUdfV42yvkjhYXHD3dVlx99qzMdQ1mDz6BNqqLCehfJ
         DClQRvdIHXioctZYnLa4vJimMgGLRFFYtlFRsgsmBEzu67BaoI4wA8hbSYAqBcIUr6+U
         7nLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788432098; x=1789036898;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G6nUWKkYtFk4ALnCq1etgf1ghLbMCyTc495nhaOBwYw=;
        b=PpZXzwTlsGCGcvHI12/BCWQFJBpO6FdjH9z5T5peYaStww6FTGQBgMExSxtTp6Xk14
         qiu8/gp18VJm6fZryh0FCxN20jnpjS+J7p64b0Ef5+L6UQfPTH8dv/vQpYKzFYPBWxio
         MYd/dUrNpMajALNop1xc0mgJ1Npy+EfexyG5dQQL49jF4xuEBg2qhvWN8gG93w5zW6A3
         S4qAXG9D9oKtMdx0I7e+r6AfbxK9X37Zs8BNV+gDrBhKtfrzDNNoDRPI1fe0A/FML0PJ
         mCCnstw8wO742AO5nBDECnPbBufOSxoGDqR1DEd4g4M3oajKeIDAh1fWHWcq53YQQcBp
         AbEw==
X-Forwarded-Encrypted: i=1; AKwUvBxNAwa3KFsqse0UzHDF4LzEFCgWvy2vTMv0O61ur3R6wNqaRmUlbgW1keBd4iZvztfGz/BZtDU687mGpvaAOUdQ@lists.infradead.org
X-Gm-Message-State: AFuF++lN63H5NV/LfwDQOMxABNp9pfK+Zc9b7jWYQtcWyS7TCy2SNZ0q
	Fm15KOzVvhsHax/zk33Hl8ALsvL8s1Qy6QYEk5Xfchage2ey1BME4Ky2B1zuLB7lTTFLtfLkg3h
	iCbA2BsFdzgSQt3wBBLCYnWi0og9SqSLUpYANaxbHRs4lS+xBBFd6/x+k9j73EWWzwYIBBn3wM2
	QrIw==
X-Gm-Gg: AYBFou3iwUxurmjpJbfWNNX1N2FkstT76cgnGcP1v0QCofuE14v9uUT52V0tiSl1CDq
	jfQIVxCcyN3uFJqd1vPEGiL/A8texKPTkboPzcEoJ7LGDRZ8bKj4PFEPUEFvv1Uw11grVGdljyf
	zEWR09k9m0gkjHke0S+hnuql0sXuEipTiKu+PUqDza1H4oYwo6JZxbgbXNFvWsPf5E8Sq5FA26b
	WjJCVLk0acqKF0D3SkDx4cqrZmrqAcfauyN9C/qc95nO6BTnGTGg7/b15R0rMRrNTwoHmt6qRJQ
	GmvpV4xCMp0ouj+Mov6mZDH1AjHMH5s1yoAuvPOsVVe3VX+4pAXuPn3ZFz5bWgdce/1stU1+nIE
	PrpUIvhvIiwZLIERvxxMrBa0rK15o
X-Received: by 2002:a05:620a:2982:b0:938:fd60:4f9 with SMTP id af79cd13be357-93960eddfcemr1154357685a.27.1788432098248;
        Thu, 03 Sep 2026 03:41:38 -0700 (PDT)
X-Received: by 2002:a05:620a:2982:b0:938:fd60:4f9 with SMTP id af79cd13be357-93960eddfcemr1154353185a.27.1788432097758;
        Thu, 03 Sep 2026 03:41:37 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce55259ecsm84661625e9.2.2026.09.03.03.41.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 03:41:35 -0700 (PDT)
Message-ID: <36e58345-a236-4b77-b49b-961a0c439b5a@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 12:41:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/2] dt-bindings: phy: Document ST STM32MP25 USB2-FEMTO
 PHY
To: Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
        Marek Vasut <marex@nabladev.com>, linux-phy@lists.infradead.org
Cc: Pankaj Dev <pankaj.dev@st.com>, Rahul Kumar <rahul.kumar05@st.com>,
        =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <clement.legoffic@foss.st.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Christian Bruel <christian.bruel@foss.st.com>,
        Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski
 <krzk+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Rob Herring
 <robh@kernel.org>, Rosen Penev <rosenp@gmail.com>,
        Vinod Koul <vkoul@kernel.org>, devicetree@vger.kernel.org,
        kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260902141312.649406-1-marex@nabladev.com>
 <34e63564-0191-406a-973a-eb601292b255@foss.st.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <34e63564-0191-406a-973a-eb601292b255@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: KPQ7eSM1NEAoHzlPcehqTJWsgQwJMGmm
X-Proofpoint-GUID: KPQ7eSM1NEAoHzlPcehqTJWsgQwJMGmm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfX7LXhnjbBDuxv
 BqAWXLzuFa6y/o4p1IhrouUgDgbGfnLpQTQIs6C2guXDI+6rzbgnQVfkCHRmqn4NELjDNYaN42v
 vWIUsGHROS3++FlcohpmboTxGqYKf8qNr5q22QEVJ+4CgxU9QhBF+TSEnRRyKIrTBv7/kmjY6X7
 hMLpGaU0Au0SDYDqpDhUI6as+ydAO5DLSd2aFTBXP+bVj6/bKIfqxZB5GBiy8srx4e+qV5Tcw8A
 t0RRcAhJwcK/ZPHjHPH8GoMt54hNswgr4LrJK0t6BbnHK5UgBU5bkoyOJZ73vweKcV67HUdE4GC
 1PB19Dx/R36rcZSGnshz5qWdcdWk7be+sWJ7W5l20lKyV43zCNuprTegeozRxOBiznSNp7hTM88
 Nsus9r8WTHN9UtJ/uBzlNPnIoRFXbRWKh8ghtGK0xTgWa/UUbQuuVdeFOgBglld+nEd0WHYxPTH
 nIRkeAe4uNs9qexqkSA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA5MiBTYWx0ZWRfX6BclJ2ZCTcTZ
 wH5PobjUIyOYg5LGT4Mo0pl9JYz8kAxzsCJji5/yrF9g4YzsLNFlKK9t9dknB16vXyehvGuk79t
 7UJX/+beWimlkR7bSJS6oJ/Or9FIOhk=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a994ee2 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=8b9GpE9nAAAA:8 a=5JN2l_4S2wR4MYYaAzQA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_034140_219266_3E5DE4A1 
X-CRM114-Status: GOOD (  12.64  )
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

On 03/09/2026 12:19, Fabrice Gasnier wrote:
> On 9/2/26 16:13, Marek Vasut wrote:
>> From: Pankaj Dev <pankaj.dev@st.com>
>>
>> Document USB2 PHY for STM32MP25 USB2 controllers, which includes the
>> USB2.0 host-only controller and USB 2.0 part of the DWC3 controller.
>> Two such PHYs in total are present in STM32MP25 SoC, they both are
>> slightly different, therefore they use different compatible string
>> to discern them.
> 
> Hello Marek,
> 
> I'm not sure if/how this fit with all below tags. For all the
> contributions you've made, you can add my:
> Reviewed-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>
> Tested-by: Fabrice Gasnier <fabrice.gasnier@foss.st.com>

This does not apply. Otherwise explain me how to execute or interpret
this code on the device.

This is a series of two patches, so why can't you provide two replies so
the tags will be accurate?

Best regards,
Krzysztof

