Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFCBC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 07:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=; b=2AFJyUrjd4Zm9hYolFIFeylWFA
	o/gfQSDM72yc3n75kTvw/doE/ovxl0KnJ3Y6yRQUQF6a8vAF78RRkxj76GCjXtRrAbvoerKR+xaXg
	ZIA5PyA/sq+2cm3y4kIDh1sFlycLh8toDv+jz8EtVFq4uuScm7z6ONBQZC0PKVver2/JwA4PTWyHg
	OINxd/WEwSPf+6K8jDBEbeekCpY0OTVmmcKMh+sEewDa9KsUzutxl/wqLQk6NINqUFz8veFtd6tyr
	zuemcm4inzkTfKLtBaVXEIlGX6+oIs3pf2PGcxyzeZ7u+ic/ZHBTP7jZGFYmb+cC13l+eW7lGQjup
	UPj3TxmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsBK-00000005bdp-072x;
	Mon, 17 Aug 2026 07:54:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvsBH-00000005bcz-2CZy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 07:54:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67H7bfhC788715
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 07:54:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=; b=TD4S54eFkBGd2wid
	FOhbw/dyQ+WhYtOZ8/hFDbJ0uOEwnH7m5o3hFLKrJAr5us5TcOEqvUahrck0gNU0
	DAb3G5dE8tJirtVLN+xM0RtJ0RyzsCRW2A0QWDvlQbr5Ah3hThiyy1lwKn/SvIdg
	ghXBqZrrvMx2vrugZ/nXK7We4spb8Zm597p1Yf3Wo3HybER4OaDmi48OGywvpWh8
	xz5kWjVAF2VyMsrRsqfwwC4Moz804224cbofNaBE6Oa/xko75xtr8ktAQhz/QewF
	j2JMf9LVuaanOkKRwUrUfPj8F8m2TwlAbWewEyIdcffr5h6HleRAa4wtvee9LJIJ
	iJx3pQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g3x30g1s5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 07:54:50 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84fa3b14ed2so2735011b3a.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 17 Aug 2026 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786953290; x=1787558090; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=;
        b=Xo6oZsHqTCo3zMidX55Nqr4W4K+bU988tASxvn+Y2JOf4IKtyPMn4s1qCKXSStJIWm
         /8tyvNvK4sourPIHR0Myqs+IY9a6vcir1m3uSlVh7scI4xxCF1vcvj+b8HFvJjxDUfWH
         ud2qo7YN9nJW1Od0zBZ2dig2pWrjwpnvzILtuV7spexhbLD50zo4lraMizvxqAy8X8mj
         mXwquYmAYQKiahSuLoFeb8eL+Kp7txdmTxcNsJtQsbBruulR1nkz9xWycXYGEdjE3p74
         Pp/UwK2Sb9eUKflGmi30kaw+SEDE7Ip7oc3fCiEwR/Ld/uDWkoauIHr8vo78YrClcF6h
         smlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786953290; x=1787558090;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27KZ5zaGlq4s+fC4SMrtgPv92WJXwCqwAOKEmL6uVJY=;
        b=n1GQ3NFjfnnrmulvllKmlqTktHnr9YWSuMJ/Z/B2w7iPeCjtzVLpH6TqOpZftNTneV
         B1ehy/G337kCnl8QtposRAYF/n82g1Wfbyw4xjlziGbngOE+yrNq+wAlbMaSx6GrcsA9
         Die1GQtso0XQTX6YqozbkjrS7sDNSvx5VJWqpv6kOP/hIwCg2IJoXZmyBWNSQWwVpb1t
         cK4xdVeWdCBd3Gz6MW3RzuTCd7FqEcL+0lTpDvr+5yvT1vcnbZxBRSaNducAQfSTn5HL
         85hT7KHmRT5GvqrmNjpsH7dSI6lskHUChR6TfJRVq9R/AvNHb9cshB6mrLEvONl7SuDQ
         BKaw==
X-Forwarded-Encrypted: i=1; AHgh+RoFPVFmeOReX4c4eowItKFW2yuTaMIoBuOfyjGfjyUHfwuenmDXERlu33Xe5c8o2kAoj6DwewMlq/uFEec+W8/g@lists.infradead.org
X-Gm-Message-State: AOJu0YzqDExy5VtF3GlcsYN07W+3ceUkwGATSyhCMZqIY062foOeVifc
	YHxgKmn8B2LgOoQ6Bl0Gr+UOtBFI0aCx2/nyZOFN3lles+suOQhs0AydT+G8LKCufyPWS2JZd3K
	KTQTvxw8fNNefhxZIOWhsRpL/ibh+SOpfs3yBQvlceUlsut34tx/2oZM3xeVRBuRhQozYXSkVxv
	Fs0A==
X-Gm-Gg: AR+sD12ypKbs/iVQsFvUxRUu0gzon+ImUz6pN3P8OWDjLAkTvOHlwJSkKqhhYAZJBZ5
	pCkTfjV7Qv3kgM9mtatMgClbaB/S/keD1mBBaUTK1xqt7/HFYoALPaQLOX9w5s/wE2g3mwY/5b+
	9tRn1jhTiUpmiG96Unba0qyD1lz790YRSeogeb1iJY1Lr4+oeywH3UEkY8KysY85VhIxARsf5x8
	52e0iuOkJoCrFK3z68DQrC8qOQIajKrvroZ35Oo4yCy6aFd2BRDuJVJP2qoHJnkpTfeZAODf/vl
	B/AVKdibQnQnHjk3/9+KmKhyCFOzH55uMJ5PMf0KgskKJ64tXB5N7vcg048THdfwhktYXKqi9lt
	FKfuwzVzyOGKo3J6HmhTWAfmatVCdmAdqV+mRqJiNeajTmoYQA+9KcsKoBROoa+HA4YzDCsSziP
	KTEyJNkrTL/gvjCPDnRto=
X-Received: by 2002:a05:6a00:88c:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84fde2b6841mr22977007b3a.33.1786953289824;
        Mon, 17 Aug 2026 00:54:49 -0700 (PDT)
X-Received: by 2002:a05:6a00:88c:b0:845:e8f3:bdd0 with SMTP id d2e1a72fcca58-84fde2b6841mr22976947b3a.33.1786953289376;
        Mon, 17 Aug 2026 00:54:49 -0700 (PDT)
Received: from [10.79.117.20] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851b401e10bsm186190b3a.12.2026.08.17.00.54.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Aug 2026 00:54:48 -0700 (PDT)
Message-ID: <05c743a3-0111-4b80-be98-b65b3a09ce34@oss.qualcomm.com>
Date: Mon, 17 Aug 2026 13:24:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/15] dt-bindings: clock: qcom: Add Kuno Global Clock
 Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
 <20260814-kuno-soc-support-v2-10-3079794f0f73@oss.qualcomm.com>
 <20260817-speedy-nimble-heron-a4aeeb@quoll>
Content-Language: en-US
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
In-Reply-To: <20260817-speedy-nimble-heron-a4aeeb@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX/+x95IbNZyRK
 +ZO37udh/aCOs+29FKjJnK5cu5Q8cFz4/56UkILSqhrvZw1okChsjtk/ZpaTYc1kSpSbk7VcZnq
 lVYWWjGopQVsHQyiWFsYjI8Xv7wxU/OABilB8th+D9GeI3m92B1JOwwkZ/bT1yV47VA30eHe0dp
 hQ9v1Xn2tuiSUYnVAPo98UpzBQ7LXlKqBTwfC6/BjDwbR/hXyDJkolXLScVwCvuZhN6k5TEsptL
 jxIZYM+sAQUMYwIFP5+5j1askCZNuLOIoBl5JNkik5K5ru2QOBghj+CpbOQx7dpLUhat9VDOIdX
 k4UfnhxF9mTs9Lwt21ipuHeCDj6YN7ODpFN94cYk6XArlokHGkpBPJKx5djZzmZUu6oaSXgusnh
 alQCMgyClxj1xWafM8BW84SlJdSRx2I+lxob7QbxSqAJ4mIRNzqdurO6PKfGqnIczwDju90pycR
 t4E+vMmL6vptPlGNiiA==
X-Proofpoint-GUID: kcXlGil9AnvosNA2bCtO4F-PEb3e6Xse
X-Proofpoint-ORIG-GUID: kcXlGil9AnvosNA2bCtO4F-PEb3e6Xse
X-Authority-Analysis: v=2.4 cv=Y9/IdBeN c=1 sm=1 tr=0 ts=6a82be4a cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=XtOoD4hAqv4hDt3uobMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE3MDA1NyBTYWx0ZWRfX7XSUkUa0k/yU
 gO2qVP0MwGJb6Sb2TwLymilMV7XmnqLkTVOoQpLzgwyaU7V8Zc1cmlf4DuW+Zx969iJOJM38ho0
 SoXp/bQ5dsJHknn8Y4uJmnuQ1dC3084=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-16_06,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608170057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_005451_575634_A7BA5575 
X-CRM114-Status: GOOD (  14.77  )
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


On 8/17/2026 1:00 PM, Krzysztof Kozlowski wrote:
> On Fri, Aug 14, 2026 at 01:01:41PM +0530, Hardeep Sharma wrote:
>> Document the Global Clock Controller (GCC) binding and associated
>> clock/reset IDs for the Qualcomm Kuno SoC.
>>
>> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
> I do not see how you addressed my comments. I should not be needing to
> verify if each one is implemented and then say again the same.
>
> Best regards,
> Krzysztof

Hi Krzysztof,

   Apologies — my v1 reply just said "done in v2" without detailing each
   point. Both your comments are addressed in v2 patch 10:

   1) Commit-message / binding style consistency:
      Reworded to the same form used across the series:
      "Document the Global Clock Controller (GCC) binding and associated
       clock/reset IDs for the Qualcomm Kuno SoC."

   2) "Not a power domain provider?":
      Correct — Kuno GCC has no GDSCs and takes no corner votes. I removed
      the power-domains block from the schema entirely, and dropped the
      matching power-domains = <&rpmhpd RPMHPD_CX> and
      #include <dt-bindings/power/qcom,rpmhpd.h> from the example.
      (binding 56 -> 50 lines)

Best Wishes,
Hardeep Sharma


