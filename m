Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E84FC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 14:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=; b=rpSPzACbMEq8rJE7SBGZBad25I
	G3EIRwm12mAY3cngi09DobdOXtZKGtSmHux+Gmt+79E0di2CZkBHElMxuvjdAZviwilq99BKatvsI
	ToPrFmSYwIqpBXhWbmy1syqcitK0jcsp2YqQXYllqXclQaALSOls0X8CzL2jur49Cry+el4DM+Of1
	YXTsYypohcnSoeZRIGZjObqhjA2VR+PnwUeSigAAobk2QRKzVQqPxLtbdhcn8tNeRxVAqnvPQ/KpC
	3n/kVhT0023iqnbU2BWvnvTl3rWa5zsyNf65wG6Vo0PmytrGBTuU8g6hqtbiFaU9MGWa+MUmtRqdn
	AieSuuFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoTR-0000000CnyE-1Snh;
	Fri, 31 Jul 2026 14:44:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoRZ-0000000Cm4D-1sXQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 14:42:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VCBuLw3776924
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 14:42:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=; b=o/rNEoJ8Oye8yOuF
	zL6GwiazrXRPiI+uF8nuWoBzc0ZlBjPX+m3pwkU8aGZ46/XUJ/H4BikXVmcxx/8a
	jEJtTz8kgaAQeS52Zv/l9JSSCEbbIvhW0j9P8T9yJyvAMyqO/Z2DKI2wcD58YOx3
	CDUxaim7tmttEvgQKpkJ+bCJ78WZCo0NGeAdCJqqzPktw8/0P3PkedyWGrav8FLr
	0+K8G/YaIQWUya9VPJ1w7TXufpter81WjdDhCP5qMIpCgmDpbwL7IFglq6wc5Xwb
	KQSnDZbRiPz4YaR4NoBTXBLvXTCd8pbwGyHz/HmAOk9lp75Jk/3OuxBrdcGz0S1l
	1WSbdQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frugh0mgq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 14:42:36 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93105103d06so18939085a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 31 Jul 2026 07:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785508955; x=1786113755; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=;
        b=ExgOxI+YIyChoVOaeKSIhsgR0C10R9h8mG/4Osq0n8zToPyWrZOUJMoy8co24E3R1C
         E8sQKAM/r+HXPqWbdny6+pXzYytGwC6m4LkM5h4XzMOY1sUyuYP/7U83EBsYHw1n87MT
         gKfZdwuylAGUhJSLxGIa/vlRYEXVtOx/+7ai2x5Qv7YSlnGuUlN6TG1TA4r58fNYQPyu
         yh7uH50kTy2hukIRQL/U4g/YB4q/V8dTMQjXVXfUdyEtTIMB7ixuPYTGUPcY1LdlITmL
         TLqylIQABFnBXxTbm3k9EZMyxstpusU8u1lMWvyPumxgaHVSOBksU3ZEZAp+iCa7W4dc
         sYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508955; x=1786113755;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hV/RxAH1jzvT9xYdfJOYdrkiDJC+wzPI1b5Q4RRYKRg=;
        b=bQVHy5I6bONtwKNJF36tb4r47fzjdZwGbnslj2Dp0iG6ARwWsphC3pDI0bkcV+vIk0
         l0xm/GOXBzq7r7Anf5GVbpnUcbBoRlJ/4OC/W5y61LSDIyvjVavOBGNYhyQLcvYnoeJw
         /nFfb1vh2vVfNQ9tFsKshrYezqzAANtgPZkz6Jr3+22RP7SIIQro/Nz9Jf+h9xUzhSk1
         qrVItJAu1Fh9NugNnb1RGHMFiZY+JtYmUDqqxb5/F94EluIDBNUCquU4Ems0q3qbpEiP
         X21JfVPgKmhLbVpuxkBHxvR+odHQ89+NdpbHwk+k1+USaGPrF609+60NPQfMreaN1bcQ
         6JSg==
X-Forwarded-Encrypted: i=1; AHgh+RqPJ/zshCDyG7xeuCZh5hJKag48dq29PAomqB6ZvOL3cSNHvton/6/VkQrPX0/icUkDW0DFVZPg/ZCMCGBdzkDQ@lists.infradead.org
X-Gm-Message-State: AOJu0YzPcfv7KvIpn4XA4cMCFV9p1VjS2YPo96gOa0/odt3HorxI4zAc
	5F6zhgVDpVTewP70bo3AO/frtJhRsfqgH5Vl9Hxp/pqGNBudr1MO9aIxQGIFIlFc+Fpzlpk5V2Y
	FzmzRtFhqXC3WJXVDwSFnRVDRv4YJBFc/ifS12hQnVWpNBLxK+3wyhZpeb5cKV60wdH40PjWZwp
	qnxg==
X-Gm-Gg: AR+sD11aaNoPyvTxeL1HGgQujN7hjjGhSS22b5BwHupIp4TNqM2mOB4WR7Z0/A7y5wJ
	8YlYvzEuKG02S0g35FdiGh1/Q72UDf5Swon1/Mi7+YfISqsXq3vj7VMK98xH3NQLDUUw7jo7XeV
	78q86/HVMHAcMiBh+zZqGlLM/D5AY6/11wZi9Sj3QrpIy/ZHgARqZaGePvcFDg0oa48f04eCmLj
	ZoaPZjHIp7hdQ8yeutcUwbXMoQq3Qmrs8fiLMbhd2+biQgIdZ24vLILqfkfQbL1YkaFmm7pR8hg
	HuEAfoAHmk62NcG70YvWpDMn/MpN6/9CewOpG00LKIelPyomFNJytnjKXnyF4dZYjRcQEdfdRIb
	f040JST0Trbay8tpl33R6E25C
X-Received: by 2002:a05:620a:17a1:b0:930:f930:a09f with SMTP id af79cd13be357-934a06e88c5mr34874585a.1.1785508955180;
        Fri, 31 Jul 2026 07:42:35 -0700 (PDT)
X-Received: by 2002:a05:620a:17a1:b0:930:f930:a09f with SMTP id af79cd13be357-934a06e88c5mr34869985a.1.1785508954780;
        Fri, 31 Jul 2026 07:42:34 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f812e3a7dsm1541071fa.32.2026.07.31.07.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:42:33 -0700 (PDT)
Message-ID: <c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 16:42:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/16] usb: hub: Associate port@ fwnode with USB port
 device
To: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-7-wenst@chromium.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260721065413.2306137-7-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfXyaIfRJsgVFLG
 6ChzOJtWYzuTwPqln06ehdGpMKkA4AWT4TihUPzZHURi4WnRb7TpJPlRvxh5kYLBmIZNpHo+QXg
 V48/vBF/200FA2UqCsMOqdeX9ZU+GZbNyNwiEFbf37Il9uiemIB6GewuD01g8yjWWTUhde83A7l
 FGiBfeqnl0bc8eB0l/rnV8Rxzqn6MQQOHIt8Xv5pD2eR+BLpixFKdRb3j/WRsAOoI+HbXTkFi75
 L07m6TC20RoOH387RrjkDsTGSfaVPm5ETrYstBEkqh3lRp/VGrIsr77U7OMj2BPkoYFwHRvj0S8
 Kh5CpvtAWxWqzCw6s/3YyD/yxX1pwre2TBXRNRejaAcSegNoIch4rqBiICq7kGkMVGwZkAQ1f2f
 dnkfBZIC9RiWeW5/IURnAaGMEKMKYJJdSY5BxlFrCSvSJCA5p0JTJDMzmkLZijeyX7aAaz9H1V4
 MgYkCaDd0PdhRVi0qNg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDExMiBTYWx0ZWRfXytZvjWDYQ27z
 Khdr+Qy2nrE5iqywPmeHdun3K1QI6Yk7D6X1km1rygMAI125Clm5rjLRAsWx6F2x+lZDeqLmAkB
 1hybqYZ0LGAJExTie00qHnfMbc3yRtQ=
X-Authority-Analysis: v=2.4 cv=U+iiy+ru c=1 sm=1 tr=0 ts=6a6cb45c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=cm27Pg_UAAAA:8 a=7ZmCE17i0x7kTLN8kT8A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: OX382cQLLUhzrX-BkoedH8Qi7L99DDGN
X-Proofpoint-GUID: OX382cQLLUhzrX-BkoedH8Qi7L99DDGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_04,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_074237_544380_A0824F0D 
X-CRM114-Status: GOOD (  22.59  )
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

On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
> When a USB hub port is connected to a connector in a firmware node
> graph, the port itself has a node in the graph.
> 
> Associate the port's firmware node with the USB port's device,
> usb_port::dev. This is used in later changes for the M.2 slot power
> sequencing provider to match against the requesting port.
> 
> To avoid potential conflicts with ACPI firmware nodes and then causing
> power management issues, only assign the firmware node if the hub's
> firmware node is not an ACPI firmware node.
> 
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---

[...]

> +	/*
> +	 * ACPI FW nodes are associated later when device_register() happens.
> +	 * Skip assigning one here to avoid potential conflicts.
> +	 */
> +	if (!is_acpi_node(fwnode)) {
> +		struct fwnode_handle *port;
> +
> +		/*
> +		 * fwnode_graph_get_port_by_id() returns either a valid fwnode handle
> +		 * or NULL. Passing NULL to device_set_node() clears any associated
> +		 * fwnode. It is effectively a no-op here, since no fwnode has been
> +		 * assigned to the newly created device yet.
> +		 */
> +		port = fwnode_graph_get_port_by_id(fwnode, port1, FWNODE_GRAPH_DEVICE_DISABLED);

This works if the node at the other end of the graph is a
USB hub, e.g. from qcom/lemans-evk.dts:

usb_hub_3_x: hub@2 {
	compatible = "usb5e3,625";
	reg = <2>;

	peer-hub = <&usb_hub_2_x>;

	ports {
		#address-cells = <1>;
		#size-cells = <0>;

		port@1 {
			reg = <1>;

			usb_hub_3_1: endpoint {
				remote-endpoint = <&hd3ss3220_1_out_ep>;
			};
		};

		port@4 {
			reg = <4>;

			usb_hub_3_4: endpoint {
			};
		};
	};
};

But something I faced when I was poking at USB4 was that dt-bindings
currently assume every controller is effectively single-port and the
of_graph ports under it represent HS/SS lanes, i.e. the entire
"ports" subnode represents a single USB port

I think the solution here would be to do ports {} under the controller
and have every one of them have 2 endpoints (for HS and SS
respectively) - then, each DT-port would correspond to a USB port
(sorta like in the hub case, minus the hubs are split for HS/SS so
they have just a single endpoint under each port)

But that comes with a big breakage, as always..

Konrad

