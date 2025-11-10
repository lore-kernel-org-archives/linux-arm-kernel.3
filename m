Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D04CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 04:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t9xnx5/NNsxUGtpH3H9vE0Zs14pQaGPl6qrNXKqGzbA=; b=mkK4srKEpoBsAWJQ6B0uovDK7W
	pgzMJ+5wwOhsQwauG+9Xv+dj6MjcaeuvD/Nzg4x6+8W2zOavVSS2VhQF3kutIE8SktMynQUnPNNYR
	4sktfnwN56ym1IP4aWcVgpsCENGp9fntqdzhCY+nXkcO9I0SvPIfDCRgG3LXhl9N5k0HS+u20Dk4u
	B9I/E8MTC06w/j9T/6gT69c08AMfabaNJOStyicWf8qCw6xyQuFSZhvVsSvezUk5ny/99LoP/YIxT
	7+uMPhpQ6rmV/yyPpXmX3BznhNhraMgqTTu+4jlWy+el43esaqWo1/RqBGAhaV4BVGCg55jG+cl+T
	1ZHL0CPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJiW-00000004jRe-3SnZ;
	Mon, 10 Nov 2025 04:41:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIJiS-00000004jPG-2EEE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 04:41:24 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A97bv2C4048115
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:41:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t9xnx5/NNsxUGtpH3H9vE0Zs14pQaGPl6qrNXKqGzbA=; b=hz9rDWispoNTjzVc
	Y1+y07xhIUp2Wr65swIG3HJAXUDZKuoyIemfhgn8w+Oc/3bh7fHZwz56neB1jPcc
	Q2fRq9AVNSXAV6dclYK8yzY4gMqyXaRTdCPdbZdxAx12cXITW/DfwixYtCR+OAHW
	Ucr5dwRoQtcjEw2+IoGFh70zNGGtGotJNzR+LGf/yD1WXIbEkgd+GzB1B7svVR1O
	Tb2KM5/0SKN1ij6Zl5A1knmxi9uLaZZVfBX29r+LN3vWE1srLt99Ws28Tj8roUMQ
	YmFAebc/AhCUk9V/LY+YhkMISsCQ8MHMhdNd24Zs+mZagEoPMLZPBLfvdOL1/GC5
	zEtIPQ==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a9xu9uc75-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 04:41:00 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-ba265ee0e34so2177570a12.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Nov 2025 20:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762749659; x=1763354459; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t9xnx5/NNsxUGtpH3H9vE0Zs14pQaGPl6qrNXKqGzbA=;
        b=UwpScHsGQSJrmFujtkbus/g/ToW69PzvgfT+kABo9IPCFTdzhSGWpj507/xz4Doy0c
         He3wOl/N1CNwTffR6HIFEktuybfMhuWXACJj3Iew3SvH4C66xtPYJlijTsf7jA3VUvB4
         bEmZqJVpsnEPszE2wBx93WWzaqydKpQWpABoGJHfgum7JqFevwsArc91EODKwkPsGAUb
         WUF+30FMud/nEZ3eS6KUArqpRQSBl04MbqiGYu+WnE3yY6MDx2JhwbSiWq6EJzSK3/OQ
         N8XSgZFdFi6f2DDxuZdbi30qs0Dv1wA0fUlBMbyafKbDDtsGLQGvr7kdDFcqHa8w3Vav
         J3Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762749659; x=1763354459;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t9xnx5/NNsxUGtpH3H9vE0Zs14pQaGPl6qrNXKqGzbA=;
        b=wUTJB/Nnplo2PiUtcviiUuwaA4MvyPV/pmlYo/Nt/E8mmQINWJnRtBgUwcQo381iNQ
         Cg5nvyLZaaIl8hbyewZQrjwkesrqg+qHWDkLu7SKrbXTylQKeNOCGVdK5ZSrqt0jHbsZ
         KWTbhJp8qcMj+RYJLpsPAEOWJdYY4CewxTxHQDjP3U7YK8v9ulIVt0JCtV/o0JY1jjaz
         Z+aaYvBhxpR487Pxn2qTjliLZsD8wu+Bl8/2A4YwOFoqKzQM49NT3AEjD0sIfZSU8J5M
         IZGuXtFJr7R6DlAS0cWW70e7PmpzWVqfMO0QtGrZBMeOj5ipFRcYsf/tkR4559qJQZwr
         2RxA==
X-Forwarded-Encrypted: i=1; AJvYcCX10NUjD6/6e0NFmE/LlqHhrFchRTQ4ZHSZV+hfBSpH4tDXpVaF23p+fDQU6qwjK9BoH1r4cBYKkO/mE4LQxxBH@lists.infradead.org
X-Gm-Message-State: AOJu0Yymghz/FuOMCbkC2P6e+gSVH/KbYtt73AYToWFOEwmUaGhtGJgO
	eKYSglF4jPpQD1q30000MTh8CZEOdU9PjQHRRWoMZtIDzy2nwRid0MoGOx9wMJ38LAon0EYVmsh
	g6aTxFaEjr4gOShe2T8kejxLcbusowy+DNVl3hZPNTmzrCXQF0p5jTyomdt5NFhH15q2emzqilZ
	u4Dg==
X-Gm-Gg: ASbGncszW1umnZgIIFYVWxeE5zyJrAck4foWQ1q+o0TRE7HD0lgnjpigQjx9j+2uhvv
	SnMyrr37C5IgQUkxE3cfbBQCPtWdLMFG7PMG+o+v4L4Wiajb8vye3okTebdPG/afyNg1fGi7eWs
	J/XZlyCawYzNA17Dtn0pcFq+QYlxayh/HqAGImbCPEtNJawLuHozVU91ZFwiGUhDgjYpco6rAls
	QMFxtn3NWTK/sa/Yoi2JtJ1V6zdRSgDTEhdPX/oTlWpZBtNRhtzOhD8Dx7/VeJq4TrPur69S2If
	/K2G8IEq3Xhjmdl9kfZL2DBihlZ3Lm0ABpp6dZ92eNJqle0/MWbWofXbz1siehCwkpETr4wEwqk
	0T6UtD7LGRxHCI1FyTMSu/qyb2SdVpmajiOYtwE0WdFo=
X-Received: by 2002:a05:6a20:734f:b0:2cc:acef:95ee with SMTP id adf61e73a8af0-353a428d5fcmr8378755637.52.1762749659499;
        Sun, 09 Nov 2025 20:40:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFs3BvO0OD7+LWZO/k7GVlxxdsy8NWXk+Q/cW7eDlhRwsTQl5AgxR/jL34RGXKgTrqDOBmKwg==
X-Received: by 2002:a05:6a20:734f:b0:2cc:acef:95ee with SMTP id adf61e73a8af0-353a428d5fcmr8378717637.52.1762749658917;
        Sun, 09 Nov 2025 20:40:58 -0800 (PST)
Received: from [10.151.37.217] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c9f00beesm10145070b3a.25.2025.11.09.20.40.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Nov 2025 20:40:58 -0800 (PST)
Message-ID: <ec5c9da3-297f-4a07-bb95-512cc607917e@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 10:10:47 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 07/12] firmware: psci: Implement vendor-specific
 resets as reboot-mode
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Andy Yan <andy.yan@rock-chips.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>, Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, Vinod Koul <vkoul@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Moritz Fischer <moritz.fischer@ettus.com>,
        John Stultz <john.stultz@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik
 <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu
 <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Umang Chheda <umang.chheda@oss.qualcomm.com>,
        Nirmesh Kumar Singh <nirmesh.singh@oss.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
Content-Language: en-US
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
In-Reply-To: <20251109-arm-psci-system_reset2-vendor-reboots-v17-7-46e085bca4cc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: XWpuWVsiFLag_dVPhdoaNxOuN_kYQkSe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDAzNiBTYWx0ZWRfXzYDui5ibqVG3
 RrgG+yhfZoAeCQ96QnOdXW07ZpN0iZy60R+jjUtI0tPIigZwHE5F5kyI2wdK60Gy8s5Ihi1k6ru
 ny9FcxB/GZrYYSlu5k3yf1Ma3kjCAC7DbLfNbOwyw9h1mOzBVIY4xBz4MSjR1Lyu2CciIGqeakz
 GIgDFxOHhf4OqpRihbe9AhwW0KV6WVk4V207g8ZDNAm3IyPcfczq1Mo8Qp0JmNonnxa2+RriY/y
 8UHRF6Lq3ybWwGxDfkTjaqTRKHp25O05l0rnnKRO51lg8dyQxols29ojFH8vvHmOwDcmzXKg8wG
 kawO8HcanlMkkj1d7tmH6PRCeLZj1JCn21Smznu7my3ALUcl0U7ZmMP+HA9tFjz4jdELlO/wa9e
 njD29wgrmd1+Nt5wetQ9zGqDeY7Ycg==
X-Authority-Analysis: v=2.4 cv=ZPXaWH7b c=1 sm=1 tr=0 ts=69116cdc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=eAYKFCynwHV13TWbRR4A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: XWpuWVsiFLag_dVPhdoaNxOuN_kYQkSe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_02,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_204120_693519_0F8DD518 
X-CRM114-Status: GOOD (  16.87  )
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


On 11/9/2025 8:07 PM, Shivendra Pratap wrote:
> +static int __init psci_init_vendor_reset(void)
> +{
> +	struct reboot_mode_driver *reboot;
> +	struct device_node *psci_np;
> +	struct device_node *np;


We can take advantage of __cleanup() attribute to simply the code paths.

Declare the variables like below

     struct device_node *psci_np __free(device_node) = NULL;
     struct device_node *np __free(device_node) = NULL;

and get rid of the explicit of_node_put().

I think, we can take up this an improvement once this series landed. But 
if you happen to respin to address other issues, please take care of 
this as well.


> +	int ret;
> +
> +	if (!psci_system_reset2_supported)
> +		return -EINVAL;
> +
> +	psci_np = of_find_compatible_node(NULL, NULL, "arm,psci-1.0");
> +	if (!psci_np)
> +		return -ENODEV;
> +
> +	np = of_find_node_by_name(psci_np, "reboot-mode");
> +	if (!np) {
> +		of_node_put(psci_np);
> +		return -ENODEV;
> +	}
> +
> +	ret = atomic_notifier_chain_register(&panic_notifier_list, &psci_panic_block);
> +	if (ret)
> +		goto err_notifier;
> +
> +	reboot = kzalloc(sizeof(*reboot), GFP_KERNEL);
> +	if (!reboot) {
> +		ret = -ENOMEM;
> +		goto err_kzalloc;
> +	}
> +
> +	reboot->write = psci_set_vendor_sys_reset2;
> +	reboot->driver_name = "psci";
> +
> +	ret = reboot_mode_register(reboot, of_fwnode_handle(np));
> +	if (ret)
> +		goto err_register;
> +
> +	of_node_put(psci_np);
> +	of_node_put(np);
> +	return 0;
> +
> +err_register:
> +	kfree(reboot);
> +err_kzalloc:
> +	atomic_notifier_chain_unregister(&panic_notifier_list, &psci_panic_block);
> +err_notifier:
> +	of_node_put(psci_np);
> +	of_node_put(np);
> +	return ret;
> +}
> +late_initcall(psci_init_vendor_reset)

