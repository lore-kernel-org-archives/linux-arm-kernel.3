Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC0EE85372
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 14:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fkEap+7cVRiLD3H7Kd8AKQiASxfaidJM15fB8m3Xao8=; b=m4RzH/oUk0ERU3ms9XF2yi9X8J
	VpVeYnCEG16xQRfCCHXKgKTPBCBwuujbcXyaoFnQevkiqH8TLsOl+5AyV2NeeNQdAy+KM7yVqVkx1
	9tGrLrvfkeiuSb94CgDwfBAb1BIt9NCr85m3VsKOV+dKzGs3zRC6k81UkEgnvFrpTnAnFubrElajy
	lp11WWpnZmP6HpwpI1rpxJrGZ0h+nN9pyFxllAURl9UKo3AZyVtqvNATLx1qe80fRfgWT0pU/+j3K
	z+ZOSIy3JmmSoIvYqzfkTDt9e1hhig42CxXC1lEOyPfnvED/autkmYlKntZC3Z38ZGSI8p0Rh5ejh
	q6QAujrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fhl-00000002A2Z-3ib1;
	Fri, 03 Apr 2026 14:41:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8fhj-00000002A0q-0Y65
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Apr 2026 14:41:00 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633DVrCb2359561
	for <linux-arm-kernel@lists.infradead.org>; Fri, 3 Apr 2026 14:40:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fkEap+7cVRiLD3H7Kd8AKQiASxfaidJM15fB8m3Xao8=; b=dN9Z3Axb9sGFmQtw
	rf+NadN5/VRs/kJn8urz3yGOUOUhudfMs5jkbsE1clbjQSRHMm3PpSy37bPqUgc1
	MzV6Y5mzGG0mBEfQDwLJW3DF79M9nsdKcEoNnlU03gkF5ky5Zg5YnZGgoHPtDtV6
	mXt1CgaSZbRcmUq4E6/DawKrOwX6o6rFaKcxzCHLI/CsvIj0CfIRbZtPbjMg92lp
	eIg2AUiNfzptKPjtj7pqEdOQ+FAaK3SGcxNwR9pJZFxkapkvY2w9hyxqKlJOg8P7
	nvDuOX/1jtr44icwP4p5XKCCpYB7qnDm5d9jXnyXaEWLDYAQCTDFIr+LZSJgh3wk
	doRHwA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daeh1g6ka-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 14:40:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5093787e2fdso79741061cf.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 03 Apr 2026 07:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775227257; x=1775832057; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fkEap+7cVRiLD3H7Kd8AKQiASxfaidJM15fB8m3Xao8=;
        b=fMF4uwMLefg0hb4pOeYsCjqn+PUC8sDPZgLxgkFGOGVkjk+l8E6qCDkdhRvGLye1B+
         LoIge9gfdg0FgtyOJhVWr51wUCngJpRqU0P8pY2KBLTzP4Wm40/ym4emMSLvLlQacB7G
         kp7K3YgexMsj8IgNburT3Sp+2IvIzDhwesjEnmTP9ECxgi49/qt27zbASwxu0/UYjEfR
         sU2/dSGkxZt2170+SRKcLm8ldF9tlIuqgsuCBd6h5ohCwBCp6S4iXXVOQuDib05OkKq/
         nUtcrdrKK/Jyi0CpD3XZZiVlRHjYpXTkbNWI1S8g2pjHJ/MEGbfA9rG78XKlB6HZpcQm
         Pv1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775227257; x=1775832057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkEap+7cVRiLD3H7Kd8AKQiASxfaidJM15fB8m3Xao8=;
        b=SCxom+WYdoKNX+mfwpLYqize98gw4xpCXS8HZcKwAXrwyfntUO3EQp4OCZtTogLFxm
         K944u1rsWDz3bHDS/3OXml6pSakin0gROKudVPv+lv7gBejpSQz4L3EGtiDY7p4B+5tO
         YUX+rfG/f2OrlCC+e8MTy6qMJBqeW1pvj9rqbWJTUWAIpgPEIs8AqeBhxlAAvqpiL35A
         Uj066AvjDlPAuC6vS/b47iYTmjrKqDhMuuvghi0eAr8E+CKQs1Cb/ZB+W7S7emnjz3zw
         0mx3IxAk+Lk1cnbAWuvBaFPLMCgT/DtbkOPmA+pslo3zqOU2An26ZfTsY/X2Ghev000b
         C7vA==
X-Forwarded-Encrypted: i=1; AJvYcCXE0KDhvJa7vBpOsXFl50qElOsZEA3hCignZSSUyxkvsxe0LP33nNemP+yuBaViu+M3XJhjNYT7bDrVslvyA05w@lists.infradead.org
X-Gm-Message-State: AOJu0YyiHc6pLM/7BmuDoZhzDtJxOOui1yZDpwMOUP5U66l8me2R/W+5
	qsmhVs04EAGxDXgqn7cV/LILJiuu4iWmp59ZK8YIE52xqmd+KQ6vLx5COi+ROqHN2Vp8sq5Sebe
	z9Y4XmiM+zA8abFT0EGaJcas+ho9RoSv2E2FGN0phvU4WfhxmFIUW5geWvhWVwJzXlDIEWgBIfb
	+uNq181lbp1Q==
X-Gm-Gg: ATEYQzynTlYwruR5RTWcWRxaxdKnMMux0RP8I+BN7jf4DrVpNtqvkeigQtTP02xPBZI
	ISeqI2KjLkcMV054+tS3o5nI3IN3Jgo4HHCcHHXz8KRhaDsHDAtj1EGNoUyjxd2maAevNdgUzr5
	VgrhovVioQZnLp4AIXCskUSfKYiX2YgmCgqApcAMKMeTmLsvv9BJsmouuJEhZBZrFxe/0BvvEXr
	F6Xok8vze1AzaGhuK1rVN5OKWtHH6WuXSkjvCocpsSwgalXJjLLZDEulkoHcqcmSscJXKB6RoEO
	UWpU/HcHIUQ23ultk+CVueNa+VFdup/C9qEfe/PXe1/Nx+j0yqxpK7Z0EmQzSsAWdsPmENsOgS7
	Se46SwjUx7Kfwq8p1ga3zPIt6Yeo+QQ8tD7exOrnaHYIdI78W1Hv2Hw74Riyc1A6+a4cjfVsyfB
	qjOUZiBMPQ
X-Received: by 2002:a05:622a:986:b0:50b:3c78:de09 with SMTP id d75a77b69052e-50d62a3dd40mr46478471cf.34.1775227257335;
        Fri, 03 Apr 2026 07:40:57 -0700 (PDT)
X-Received: by 2002:a05:622a:986:b0:50b:3c78:de09 with SMTP id d75a77b69052e-50d62a3dd40mr46478051cf.34.1775227256925;
        Fri, 03 Apr 2026 07:40:56 -0700 (PDT)
Received: from ?IPV6:2a05:6e02:1041:c10:ae20:597c:99b8:d161? ([2a05:6e02:1041:c10:ae20:597c:99b8:d161])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488981de7fesm22558685e9.9.2026.04.03.07.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 07:40:56 -0700 (PDT)
Message-ID: <8c548166-af30-4b5b-be2b-15199322d343@oss.qualcomm.com>
Date: Fri, 3 Apr 2026 16:40:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] dt-bindings: timer: fsl,imxgpt: add compatible string
 fsl,imx25-epit
To: Mark Brown <broonie@kernel.org>
Cc: Frank Li <Frank.li@nxp.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:CLOCKSOURCE, CLOCKEVENT DRIVERS" <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>
References: <20260211214947.3705328-1-Frank.Li@nxp.com>
 <aaiIdS0zRPBY81aE@mai.linaro.org>
 <ac9ztfwZMrZZgTeP@lizhi-Precision-Tower-5810>
 <77a77b79-a489-41a8-98c0-00242cbdf24f@oss.qualcomm.com>
 <3ba9e33e-8d58-469c-9c21-5861c0f6c5eb@sirena.org.uk>
Content-Language: en-US
From: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
In-Reply-To: <3ba9e33e-8d58-469c-9c21-5861c0f6c5eb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: KvBR3MnpaE7rLvi_mufAxTs_EaC7g_Tv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEzMSBTYWx0ZWRfX8aTSpqEwLPAI
 zfL0lV7wmT4elNVrHxy8gpcblsmKa066LxjbABe1RSQJ8N77/Mymbqoc9yDvO3T8+UVXa00u2dh
 szd9RqJPwiZ79A3VUsvaYrUVNXYDCItGAcS5q+zyYOpLVf/3mMYjQf3QIgKFT1UzkoWWdL+wCfo
 g385HuDydD3Zz+axqcAwHEOUC4Yz0AXB6ONXxbut4jJHkJvkCd5+FzHAnxsp1MMZH+BRkdIiBRq
 jpQx6auPksrzK6Vi09zZPVtUUt9dRregG3RMOMJQ5D/Zsie7b0sBYY/825w5awyiTde9xg5L3ns
 3tAfqCpqJRKAOQ6ZMdnjZUe2j5QIhjkgjBHiWkzdXppOCLuEAGY8bxDDJfZrZ9ZMI0sb4W3i+K/
 qugo59ttyJv03prVzUMGIlrxcK1nGJFNcKCyX7/LN9BdbZ+S8BDyYTp+B09zx8yKqHA9BHlWAnx
 lYEkWrDsJUZvVlx5e8Q==
X-Proofpoint-ORIG-GUID: KvBR3MnpaE7rLvi_mufAxTs_EaC7g_Tv
X-Authority-Analysis: v=2.4 cv=JoT8bc4C c=1 sm=1 tr=0 ts=69cfd179 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=pdw9z0OCORkzPJei4WQA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030131
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_074059_295395_99AE61FE 
X-CRM114-Status: GOOD (  14.39  )
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

On 4/3/26 13:43, Mark Brown wrote:
> On Fri, Apr 03, 2026 at 10:15:49AM +0200, Daniel Lezcano wrote:
>> On 4/3/26 10:00, Frank Li wrote:
> 
>>> Can't find it at linux-next master branch, anything wrong!
> 
>> The patch is in timer/next but may be linux-next disabled my branch
> 
> I have a timers/drivers/next branch in your git tree in -next but
> no record of anything else.  That branch was last updated on January
> 20th.  If you want something else adding let me know.

No it is ok, I had a confusion in my branches. I updated the wrong one. 
Now it is fixed.

Thanks

