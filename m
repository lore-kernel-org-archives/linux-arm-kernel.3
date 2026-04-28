Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1822FF8868
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 16:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oTBXlzBBZlWSoHCmYvGZWSDv4F6oGnlfamm92+5TKeo=; b=zqr6VFf49doi6H0ALBSEhSFgDC
	7P3sRKeITC7a33BaVR9ekRkU0Smqrtg+RIUS//eBQITkeaJgfoXbdbEuyIDKmZJyJ/LrvYhErVCZy
	ZRkmapj3LyRsRDM84/UG5G3Y1oL0RgIukmO7aM76wj/+T645KzCt+v5SBKJunrT5mnPKKCRDSvJ40
	vU3OpUbwhhQcM33g44eBBWArcL7lri35645jCavphaQaoK7lsgHai6f/a1IGYCjaOYzH5Q7mGyZPz
	nQlA6UaqIabEzvEAQpSTnmWUWqRuxfl65Sgx1qJ4ceXFYwzpbCEi3ETtuOHIVxSIibebykGlC7bmD
	nXHmubfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlIq-00000001w3S-1lCY;
	Tue, 28 Apr 2026 16:28:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHlIo-00000001w2v-04lr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Apr 2026 16:28:51 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63SFsOuG2843734
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 16:28:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oTBXlzBBZlWSoHCmYvGZWSDv4F6oGnlfamm92+5TKeo=; b=Pf221uyLuPZpK6ep
	vGBz5U6reqNt6L54wSiRPN1rdkNdb6bzGCdMtrgoSNFnxOaBTZUKTkHhiblECSv0
	q7QklORkJ3xXbhoRVJzmKjQOuOUeqcs8GRE0SG7bQlrRRoug3zEiGfWtaXu84Eqb
	KfcZ2EElAZ1CBtp0FKCeudPh0Q3aAKSokoSdpTVEVdQsnPpWyITwxVy1pG7wQXpp
	fGu08dCQSbIuTZkc6yr++OLQtV6ADp+oqVRfAbUhhX+9Aa4jiIGMPGTTpKNE5hJO
	DxJ+z0CSK12No5nU0t8agAKmBvmbFwxFrokDOxUTEHIqO6mZAW9aKrGm5lw9PJmf
	GBRzjw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryda3yq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 16:28:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8eb04352972so793844385a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Apr 2026 09:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777393728; x=1777998528; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=oTBXlzBBZlWSoHCmYvGZWSDv4F6oGnlfamm92+5TKeo=;
        b=enV8iM2ELLcVL3GAy6Yq5oDBcLBPcqdP8bIkUEGUz8ifyOqjexGxv0i/xjQXvqIV0p
         ylt3VWu1HohvO9nLJVIRggwGwGJuH/6L43zI942o3YXkwqYhpf2/XmEHWhjg5kO+sBeG
         9gUL4W1Lpy2nH0+C09eoCzJOf294raWpN/MMU1PQ8bQdqOVYW/8/m02FWSAg42LCkttb
         EpDvCNupOIYTRALU4uNajpDPKxLerVWzQTM6i5emR2JfD1p9nIexUiTRpcD5mN18YPbX
         jpnqjuOe4FUz2Glufz1B3dQQS3nzE3LTeBBNiY3/T1b0Fk11DYgw+7MrWRqrhCdiuWac
         b/8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777393728; x=1777998528;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oTBXlzBBZlWSoHCmYvGZWSDv4F6oGnlfamm92+5TKeo=;
        b=LQpz2/f2JYdb6EdFfKqETcFFvY/vIAnWYkLzWnj++aL95BAz8W0k39NkUAaVyGomT/
         btV/9ARFOvWGenxkBafHKWZawinvxDS6B/ljSOIIyp4M8Vvo25hifVM5G/fx6lrnW7fY
         OakA04aWIIKCQfVB1f+Ed50qO30/A8IgA0F/6MCIMMyzXSyQUZM0elIartH/Enp/B9h8
         7zLZQIE31KvJ/m2bjNg2GIAfiD6+3Oyr0ZeOHj/IHYmPn4hE1NmDpfQ0tWsPKBaU7crN
         hdFdHeh1sCw0jnu9sLx/NPtiB8NQRewwcifB4WA4DDJl3FfqokYzUe1qs6CF60RMoOuh
         3ttg==
X-Forwarded-Encrypted: i=1; AFNElJ8LQBIZK6pEykKCf+JAa8dzGagu9gP4C4OMzkrkrr6XEPereenvzHFFy5yfejFXClOLLqz/nf8WEbtgxLZd1oZF@lists.infradead.org
X-Gm-Message-State: AOJu0YzXiqw2N8YysTP8ZmOGdB4Zm0pIwBSSWMBO4p5LXsTedZj1ieTe
	+OQGvJCrJMtl0KL4Kq7iUf7bSUWwypyRlXxREJnikZuFRPwKSZrT7FB+KaDi02LKghOibP5uolv
	1pE/4j0/qmJPHMJnx7pOnGvI5OW1q6GyyZaSTPN2RUOAN1KZ11e//oRLlFrcO7XNdJacy1y2BBF
	65uw==
X-Gm-Gg: AeBDiet9l+6FVgr/JDqhD7u14srwDkniYSEt5voeqaSCCqAGA/iruny6aZgr4qHfHRf
	kdVnXdbFZicDq0DbraE/YjrUFUbXs5aYYtsO2t79RL7aAJA+lgqwL0IB+7uutio0VanaaznFObR
	mViKP0UOTlu/t34SycNQpkXvS3lvZr53/nVUBW9jMJLgjSellMzajlYyHV8ko111BmBTsZ4XK57
	ZnNOPs+GKqL+PgZTJ3t+uNrElFcYLWGc7j4n68nsBnWMryx/oZtFvjdqIi8VDIZqRcO5CPT3VNQ
	01be5qL3P/GaRvs2WqdhQUKrUQPaBi0d1vItgZXHJ0hrknHSMwFP7wsns5zbIbl0krNF8G20HGZ
	bA+H9qQRMqBSYC9QiVV9VROra9QJcb4mpbKn1TQD8womtx7pio1jRWRwrJ7E=
X-Received: by 2002:a05:620a:1a1e:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8f7d9207991mr522154785a.39.1777393728408;
        Tue, 28 Apr 2026 09:28:48 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1e:b0:8c6:a2f2:d874 with SMTP id af79cd13be357-8f7d9207991mr522147985a.39.1777393727761;
        Tue, 28 Apr 2026 09:28:47 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8f7c7dcf4f6sm234844885a.28.2026.04.28.09.28.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2026 09:28:47 -0700 (PDT)
Message-ID: <e5e60e25-9edb-4b1f-811a-ce719ea89ed6@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 18:28:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: qcom: Make important drivers default
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Russell King <linux@armlinux.org.uk>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260425155505.83688-2-krzysztof.kozlowski@oss.qualcomm.com>
 <CAD++jL=yCM80YHV3bKTVVfNoYsbTLJ9oV=3sJ8JcL6ftvWa3_g@mail.gmail.com>
 <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <3e7b941c-b297-48ea-89b7-e21a51f56acf@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RddkZaevw4BvlCo20qipqP4leo5U9t9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDE1OCBTYWx0ZWRfX1RIyJ65jTJcZ
 euxlKrizh5kuWn992wdLmcQaXATNk7SOprtZG43fjxKe2K1QM6ZDSxmgBcHbVi17OBUMQRxV24f
 9DoGqFWZIbalo+3J5UqXBHMHWte3lQmST5E5xPH5OIIcjwasb4xAK+vvCtb3I2TgNfEVsm7/oYv
 kOqNdqAlzUmpLzZXvbuaFGNvlsBU6d17IQRFgCABZfG//cK+25PT61AEb/e6D0aFgX9GJBMY1Mr
 aqyCm5qsuDv64WgyinfsRTDprJmBiPCvS+sy1fswf37elScPFJ7Ea4Q088r4NvS0AGvOFamgvNT
 RiSSKshFhn8fiEtS/xGhaqrc1F7RiF6rBYbSSW7Fy54L+LxNrFUDLaQ2VSBMf0AIOOGjihF+OOw
 vLCyvHS2mOF0Ar+ZlUDIia/WbP/Xz/0DVd+bOzrWHT17vnBacSQdw56V7qaSnLp39CyZYW/xLKe
 gBziaxmNgYDlVSAv53g==
X-Proofpoint-ORIG-GUID: RddkZaevw4BvlCo20qipqP4leo5U9t9_
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f0e041 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=2BwYiXoGMfxsfh9iLqoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_05,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280158
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_092850_063209_FF670668 
X-CRM114-Status: GOOD (  14.31  )
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

On 28/04/2026 14:06, Krzysztof Kozlowski wrote:
> On 27/04/2026 22:18, Linus Walleij wrote:
>>>
>>> 3. arm multi_v7 defconfig: enable drivers necessary to boot ARM 32-bit
>>>    platforms, which are already enabled on qcom_defconfig.
>>>
>>> 4. COMPILE_TEST builds: enable by default all drivers for arm or arm64
>>>    builds, whenever ARCH_QCOM is selected.  This has impact on build
>>>    time and feels logical, because if one selects ARCH_QCOM then
>>>    probably by default wants to build test it entirely.  Kernels with
>>>    COMPILE_TEST are not supposed to be used for booting.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>>
>> Way better like this.
>> Reviewed-by: Linus Walleij <linusw@kernel.org>
> 
> I think this should rather go through your tree, because new drivers are
> coming and some other changes from me might be touching similar lines.
> Well, defconfig also might be changed in parallel, so obviously someone
> will need to handle conflicts.

I'll rebase on recent patches you applied.

Best regards,
Krzysztof

