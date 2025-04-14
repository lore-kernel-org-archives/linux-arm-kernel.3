Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E445C369B2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Apr 2025 11:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EbZ/7NYSQIH2cjZdJu66a5YVTDn2d6A3WWziI79Ht0=; b=sAH/pLv+M0owo0CHVPtwOjg8co
	4rHpUxquLfHsGQGNixkK5ZtOfkAYGo2mygFS3S+GRX2GLLKBoJueSj4XfRRw/A9oXZs5F2bSgkS4r
	QmCXesA4pB3A2rk/oi3EE4so/Y3y+acG7Htt66kcAiFS+ZM6IStSLqZ3fHek0RcSpj5W6e1gORla5
	Q+12hWLRc2NzfRHzx88rhoQypmjcn/5ktCVxzP91kB5EEQk4gesVukt5h8OP++jtm1BNxotp4yDxI
	T2telMRSodpdxTgaKtMGrzJN5LWwqND20w7QioYN2mM7FcI2K+J2FTjeojn5cmVJflP2a6vs/Aqyo
	+7H2OeZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4HtV-00000001kRQ-1EOQ;
	Mon, 14 Apr 2025 11:22:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4Hku-00000001hsn-0zoM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Apr 2025 11:13:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99qdc001754
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 11:13:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0EbZ/7NYSQIH2cjZdJu66a5YVTDn2d6A3WWziI79Ht0=; b=EMH8o4UiuC80ePp5
	bTfw+V5gsrNTJyr5ErSeCcejqaOEE7efz0FI6/+TJd+hSUi/Pn7oqsw9/uPrNrIK
	01F3VCO5qtsWnNBoxrPHR7/BukU6wQLZFdSiC0o/j9pZinVPSWOEIvflzJ+uEmw9
	KwdDovqji/+ymjp0OGqYdu5+ZQhICieELp6b3yKBQWwf62Tk/WlF7R+H35SiYYd5
	EXg0oprAgxfHyfCpzm+ksPBnh6RMSTkbgP+2tqQ9wZYBZE8JqxivdiVU+WqWiN/n
	AaFT744056+93JgbBUuSKrGcnxw5dG8NANk2LIAhxvqhI1oNXPG+AMKNqButGZHf
	LrDcvg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ydhq4j30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 11:13:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-476786e50d9so8939801cf.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 14 Apr 2025 04:13:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744629214; x=1745234014;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0EbZ/7NYSQIH2cjZdJu66a5YVTDn2d6A3WWziI79Ht0=;
        b=FfeJ+6DUT+vuthgl8QQPSuqUghrjp0vm+iClDgd/U6qAuFAAjncVi28XzrGp484dX7
         anlmWlR5tjToWxNuxrpmNrw972QzzjgmVYGCNtLeFKvfYXfbC+G/gy07iKaI0IgF24/W
         /9AGvrTki5AcQdYeiF2Po+Z9NyDOWsfF3iKX2xmlsx602qMYxBwzhZ5toS959y6SqTf1
         3dLz0PzmpBkOO3ep0oOmFpct+6SZoVu65FW5UOtLzMXJiOTZOPKWoXTd7bQVXHiQlLZD
         iVwwjW9GE0WP9OVktfB/7ImFO6IbKZLvQUYrXIeptKUzoLhQegGPGzLAn3LE7h8AaTOI
         WSCg==
X-Forwarded-Encrypted: i=1; AJvYcCUkhuzXnk7jy0xbXKOE4BQxqxqjuooqAkZ/0ZXX346F+7KvJ9eW0CvCy4/m14zMts1HBezsBgsO0cpnd6JSPCy3@lists.infradead.org
X-Gm-Message-State: AOJu0YxZQw8MSL2Rd3b2wpJ6AuAG7ThtXVtG6F2G4tU/01xXnR8eQZTW
	L6jvmlzszSL1u8MV1y7lSuBb6JizaPXVbksYRRDITDraUhcNpwbWObf65dU0/l7Ad+nCFCLN6yy
	scrA+IvJbR/6dEtbUcNs9q/N/PNA6Azx4+oxc9nx2YIpx4eCn/DhXLjeei3a5CO5w7uST7VFEOQ
	==
X-Gm-Gg: ASbGncvKtGObxCalXlFWc/h80ukd5Y9xh6qo7TGDMWzK5f3Z9VU7A02O6b2mI8RYM6N
	anv+eFqBPQUA5eOZpztrDKNzb1sYcLHWbyYVww0J6hiatrE9QevArk6brXDNnIEzqxJWG4Hip3y
	ExBbG37YgjqPAn88Nh2u3r+AT9xflEyR7TVi9EmXi4yXck4dFxT9UCapsreVIgVS/5RHnavmses
	1BgRuRg9wFgUQiLXstVxQ4N4SBhr4GpIItDRmbuXqb3Ub0YFwuz1KXl995YEyBgJSPC+rPy4Wtl
	pJQhyDLlFaSsAvYjCPMg0PbiOJXsKVa9Hn/zqvt1lAVnq8ZrvtMLyy3zsIrsMyJ0ZA==
X-Received: by 2002:a05:6214:f0b:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6f230ed2d8emr52864916d6.7.1744629214002;
        Mon, 14 Apr 2025 04:13:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1Jbmw7xqykDTZc49xLzKxc4E3Rb3zQy24sMs1xRcp71xMPft8CUZbEMdUMS6+juIPQDVqtw==
X-Received: by 2002:a05:6214:f0b:b0:6d8:a091:4f52 with SMTP id 6a1803df08f44-6f230ed2d8emr52864726d6.7.1744629213585;
        Mon, 14 Apr 2025 04:13:33 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce81c5sm880990966b.184.2025.04.14.04.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 04:13:32 -0700 (PDT)
Message-ID: <c14dfd37-7d12-40c3-8281-fd0a7410813e@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 13:13:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 10/10] arm64: dts: qcom: sar2130p: add display nodes
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250314-sar2130p-display-v2-0-31fa4502a850@oss.qualcomm.com>
 <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250314-sar2130p-display-v2-10-31fa4502a850@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 4GaRZAzhXAfuXnDFpUzsCuvHkwIteI7N
X-Authority-Analysis: v=2.4 cv=C7DpyRP+ c=1 sm=1 tr=0 ts=67fcedde cx=c_pps a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=M9PBs-WKjKzZjRsr6pgA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 4GaRZAzhXAfuXnDFpUzsCuvHkwIteI7N
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=738
 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_041336_406753_9A022550 
X-CRM114-Status: GOOD (  13.10  )
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

On 3/14/25 7:09 AM, Dmitry Baryshkov wrote:
> From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Add display controller, two DSI hosts, two DSI PHYs and a single DP
> controller. Link DP to the QMP Combo PHY.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

[...]

> +			mdss_mdp: display-controller@ae01000 {
> +				compatible = "qcom,sar2130p-dpu";
> +				reg = <0x0 0x0ae01000 0x0 0x8f000>,
> +				      <0x0 0x0aeb0000 0x0 0x2008>;

size = 0x3000

[...]

> +
> +			mdss_dp0: displayport-controller@ae90000 {
> +				compatible = "qcom,sar2130p-dp",
> +					     "qcom,sm8350-dp";
> +				reg = <0x0 0xae90000 0x0 0x200>,
> +				      <0x0 0xae90200 0x0 0x200>,
> +				      <0x0 0xae90400 0x0 0xc00>,
> +				      <0x0 0xae91000 0x0 0x400>,
> +				      <0x0 0xae91400 0x0 0x400>;
> +				interrupt-parent = <&mdss>;
> +				interrupts = <12>;
> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
> +				clock-names = "core_iface",
> +					      "core_aux",
> +					      "ctrl_link",
> +					      "ctrl_link_iface",
> +					      "stream_pixel";
> +
> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
> +				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
> +
> +				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
> +				phy-names = "dp";
> +
> +				#sound-dai-cells = <0>;
> +
> +				operating-points-v2 = <&dp_opp_table>;
> +				power-domains = <&rpmhpd RPMHPD_MMCX>;
> +
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +
> +						mdss_dp0_in: endpoint {
> +							remote-endpoint = <&dpu_intf0_out>;
> +						};
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mdss_dp0_out: endpoint {
> +							remote-endpoint = <&usb_dp_qmpphy_dp_in>;
> +						};
> +					};
> +				};
> +
> +				dp_opp_table: opp-table {
> +					compatible = "operating-points-v2";
> +
> +					opp-162000000 {
> +						opp-hz = /bits/ 64 <162000000>;
> +						required-opps = <&rpmhpd_opp_low_svs_d1>;
> +					};

> +
> +					opp-270000000 {
> +						opp-hz = /bits/ 64 <270000000>;
> +						required-opps = <&rpmhpd_opp_low_svs>;
> +					};
> +
> +					opp-540000000 {
> +						opp-hz = /bits/ 64 <540000000>;
> +						required-opps = <&rpmhpd_opp_svs_l1>;
> +					};
Weirdly enough the 540 rate isn't in the clock plan for the pclk
and so isn't 162

> +
> +					opp-810000000 {
> +						opp-hz = /bits/ 64 <810000000>;
> +						required-opps = <&rpmhpd_opp_nom>;
> +					};
> +				};
> +			};

[...]

> +				assigned-clocks = <&dispcc DISP_CC_MDSS_BYTE0_CLK_SRC>,
> +						  <&dispcc DISP_CC_MDSS_PCLK0_CLK_SRC>;
> +				assigned-clock-parents = <&mdss_dsi0_phy 0>,
> +							 <&mdss_dsi0_phy 1>;

Krzysztof recently introduced defines for these

Konrad

