Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3B39CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 11:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ml+7ACGSsIoRB5tIYgTA6IwtQ4AbhO2ugzv1mrLcl/A=; b=jWWXg8myiwAowBYgctX3p4lLm5
	OYl8K8dHEB85YVAYOBwMih/R3ZvN7Rhl0zoOGZ9DBdpMLy91Zs+S8SlzVr5zixhg9Ke3UGogJqTD8
	It2j6MqWQxW5EEosQ8tSRrsWGx6nMabG4dCsfdm2pahsePNQaz7vNGFxmPHqIsBpQGqJiUNd+5y7H
	OZvs6jrA+malmorATzTw6dYqbeCygJjBaSJcf9yLShVYvlpj2RLzJ3fzddQYXa1kOyihAHWi4kU5i
	TFK9Kr+bftKUsAY8ZKosOJL6ktCmldYCfAsg92nqyMPPh2tNLPAkGF7xDDCr8tmnN7tlyGpIG0u5v
	ld5x07YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8pU-00000008eqe-0dGp;
	Wed, 12 Nov 2025 11:16:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ8pQ-00000008epm-3f2F
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 11:15:58 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AC9hUYv907555
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 11:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ml+7ACGSsIoRB5tIYgTA6Iwt
	Q4AbhO2ugzv1mrLcl/A=; b=HBh1CGN61fVZa5A7AWCrPuz5d2M2CiITxKu4Z2dX
	2JNvbsXNuBum2VyWbXBMalHHirqNQoPAUT4OQ+TooWuvJq9Soss6e4W/fw3osbg3
	1mvyuFxHTMYBOXiguVJphiVdJg9swMVkQugTu5LQFBEb4p8mtBZ4vq/l+i8qScMy
	dVJxTwe2cXGJfu3byOTRCGIO1vuZz/CEV8tJkXBEOOV8kJBe+Ib/KXYj2ZpeGKxB
	PSXv2HTwXhH1Snf1JiZ3Y9yKGPcPhUXqA+TvuEeDtwz1woZ0rfXKrlfqcmU6UyRK
	UfUgYPUF7wcD/YK3hPTDbFNLvZL/Fxe6qsmMADb729PV9Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4acqur88vb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 11:15:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b993eb2701bso698988a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 03:15:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762946153; x=1763550953; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ml+7ACGSsIoRB5tIYgTA6IwtQ4AbhO2ugzv1mrLcl/A=;
        b=LnEx52ooOG5DDRgCfiWMDRxJwim/t+83Ne1t5pW64KkA5S96gw1kT+mueVbf1OR/WS
         DflAnJ4yJ4o2/zTs0kT6Rb+ZZy/GEy9ML9xVtKexzpJR0tciLIUfH9iE1x0pnK/ZjIX0
         zyAGUNCb/G3ugMLVRqqCH270QxY/5FUbe8I9WxLdy/1QIdHi4VyAMXfi1aifGEFde65r
         qmyMjtzLsjwuYmpA+0fVsh5yIsXaye16ykg+8KI/JSCjAkIiOVEmbvO1qVRgmK1znP+W
         75R7alZTMkfsGc9c5NO++cfsFRaE3L7iyAdP4mLUcRiF+4FE0PX335f5QvXBtu7UVNIc
         UI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946153; x=1763550953;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ml+7ACGSsIoRB5tIYgTA6IwtQ4AbhO2ugzv1mrLcl/A=;
        b=rpnSZgQo50D9l8IRhLrVpN64+niJLCo6dFPRuN5KrNW2Zv7WwXxMxqiQb+a0old4ke
         ORZnUZTCs/mOC2dlGGtx4Up9/0TvkIJlDITfLl8L1+vyXhfq3K2/rhlR3XVGtSODEOu5
         Jsbw9kNg0BfMPWMGmndiQ6LA5/uHzI/HZ7I8Dhvclxy9uTbcwSn2T0/FR2zJqIezi6wS
         HPhy4oBMBTMK2/TrX2GxrV2MnDcIvzyLz8QQgo8a8ww9fYvIkIHIGkvYc4o5geMg/w+B
         KjVUPpJyQQ/dxxfqiorURBzOFZRu7J/4oX/fosen7vx65NHpQu96W6MAtnlcEPSDQVcW
         LKow==
X-Forwarded-Encrypted: i=1; AJvYcCUbln4bNWM6sIuY3gcXJUfRUKU8UkYwdKqP80iVv0oGm3CYbEDvS1rVGh3innD0j2pU+vAAOaDQFJ4WF6I5E4E+@lists.infradead.org
X-Gm-Message-State: AOJu0YyO6JCMdhSoQB4pBuqriah5tlQCeauwpvZ5iIgIx5QlOMitvySL
	gemwxMv34j/+vdENDaumEfwCg/7HJN3aJrYFbMl7XxpeGhaAGwL1SXpB0gri8lVudLtEyMKnBIi
	nLSxnvtUS9UDbM+pjbOLMzuuf6osgodbNusIbdrRYrNA3f7EJjzMmXMUi89pgHFYw34RuwnPvic
	F5rw==
X-Gm-Gg: ASbGncvWFa58YREcEEPCtKwDH1ubjSocxeXb0TthoNJLw+Mgioj702ujUyYtdPnJCGw
	uy7z2aZ+go45eMbkodHOo6zuStsXKsUk1VzGaPuO9cmc2TzcwKCAkRnL/fNDUODG3wWiRlhPWOA
	NTfl2ptXvw2PK6to0ClhDGwGqm7BtBp0y+Db1DaPcgYLET+nRW96qnzzFXbA01PLo1pyuviTYlG
	4lGneZPpUj6pl5LxB3l45qkSDpKZV4hSRH82f3ohZRdbLQCdkyADFpUjz3LQUNJu1ygbyZos32x
	3iDkjrJXyv2vvd5phmbVdGj1oXPderHrsZTioKa/AksutPEJsxuKkSwbq9LvdypagRNMHzd/MwN
	zU6Av8uq4/dMw/pcuuwimoW/kow==
X-Received: by 2002:a17:903:944:b0:28e:9427:68f6 with SMTP id d9443c01a7336-2984ed82890mr31516875ad.27.1762946153055;
        Wed, 12 Nov 2025 03:15:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEQo4qACRIp+OedhfY/26n73XxSpnD0V+0fp7zIBbHeBesKIBwMdeFL9nZ+Ozf7XBOO8UitOA==
X-Received: by 2002:a17:903:944:b0:28e:9427:68f6 with SMTP id d9443c01a7336-2984ed82890mr31516185ad.27.1762946152292;
        Wed, 12 Nov 2025 03:15:52 -0800 (PST)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dbee127sm27439685ad.24.2025.11.12.03.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:15:51 -0800 (PST)
Date: Wed, 12 Nov 2025 16:45:40 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Souvik Chakravarty <Souvik.Chakravarty@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Andy Yan <andy.yan@rock-chips.com>,
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
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Xin Liu <xin.liu@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Elliot Berman <elliot.berman@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v17 09/12] arm64: dts: qcom: qcs6490-rb3gen2: Add PSCI
 SYSTEM_RESET2 types
Message-ID: <20251112111540.w57ygzrvc6m3qbrs@hu-mojha-hyd.qualcomm.com>
References: <20251109-arm-psci-system_reset2-vendor-reboots-v17-0-46e085bca4cc@oss.qualcomm.com>
 <20251109-arm-psci-system_reset2-vendor-reboots-v17-9-46e085bca4cc@oss.qualcomm.com>
 <20251110122824.5je5jfoanivl6xrh@hu-mojha-hyd.qualcomm.com>
 <btvknf3tcqhgxzf7ckyvfwix6hxle2bs4whyayan5haaejo3sm@gnbszdys32lm>
 <20251110161950.ngs4ihn3asijoqks@hu-mojha-hyd.qualcomm.com>
 <cvfr4zaceknma6camborq4ro3lwbx3dfps2zjagwhwmvwoxriz@jwybwtzdd46u>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cvfr4zaceknma6camborq4ro3lwbx3dfps2zjagwhwmvwoxriz@jwybwtzdd46u>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEyMDA5MCBTYWx0ZWRfXxCBVKy3ZyNOi
 RCkMtTibYq3XQZ1RkW4iOTYnhXO0GgahMbkpzqs+PUvw1MjWkvdExGcGYOJ5UtlNjgFS8uv4qIg
 z0pLaA0H5ijTEuuRAdvNhfOvhISV95p4l9kYtCugxqd4hBzRxLd0rDlWuD9xi+VeNlPzHaGIZpM
 MXyWROTipbBUFqIY3zxqu2qWRX3bzGQjzGlYKV34IOkC1on0bSIpJnZ6d+wyG95QHoWzMXuz1tV
 p4Fe0Lx6PO9395FNVqdJUA7K2ENJGxLvXKzU3AoMG+LvESLLidJweLDVUX+KtVIadyOdoZLqAD6
 Hxj+FyIKeh7N4Vh4RDNwNvG5Xlh2AXfCu5JTdyai+bQEvU6IvItg+g+wT9KrLq/85xZPEpBZ6Wq
 VMYARjIL+Xl0cQCDwKoCyPI4FxAp2A==
X-Proofpoint-GUID: 9LQhZt0FRxgfWkImSyytYQPcLpeq1kkg
X-Authority-Analysis: v=2.4 cv=bbBmkePB c=1 sm=1 tr=0 ts=69146c6a cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=Kkq7PJKcI6aLCMVX8OwA:9
 a=CjuIK1q_8ugA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: 9LQhZt0FRxgfWkImSyytYQPcLpeq1kkg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-12_03,2025-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511120090
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_031557_051263_CA96B295 
X-CRM114-Status: GOOD (  38.28  )
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

On Tue, Nov 11, 2025 at 10:52:34AM -0600, Bjorn Andersson wrote:
> On Mon, Nov 10, 2025 at 09:49:50PM +0530, Mukesh Ojha wrote:
> > On Mon, Nov 10, 2025 at 09:30:26AM -0600, Bjorn Andersson wrote:
> > > On Mon, Nov 10, 2025 at 05:58:24PM +0530, Mukesh Ojha wrote:
> > > > On Sun, Nov 09, 2025 at 08:07:22PM +0530, Shivendra Pratap wrote:
> > > > > From: Elliot Berman <elliot.berman@oss.qualcomm.com>
> > > > > 
> > > > > Add support for SYSTEM_RESET2 vendor-specific resets in
> > > > > qcs6490-rb3gen2 as reboot-modes.  Describe the resets:
> > > > > "bootloader" will cause device to reboot and stop in the
> > > > > bootloader's fastboot mode. "edl" will cause device to reboot
> > > > > into "emergency download mode", which permits loading images via
> > > > > the Firehose protocol.
> > > > > 
> > > > > Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> > > > > Signed-off-by: Elliot Berman <elliot.berman@oss.qualcomm.com>
> > > > > Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 7 +++++++
> > > > >  1 file changed, 7 insertions(+)
> > > > > 
> > > > > diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > > > index 721a26d49ccaeb1429e2cc1c3a5c8d9517da3be6..cebdedd5d614b9efb6dfbee91dd67f3c3e322a38 100644
> > > > > --- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > > > +++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
> > > > > @@ -935,6 +935,13 @@ &pon_resin {
> > > > >  	status = "okay";
> > > > >  };
> > > > >  
> > > > > +&psci {
> > > > > +	reboot-mode {
> > > > > +		mode-bootloader = <0x10001 0x2>;
> > > > > +		mode-edl = <0 0x1>;
> > > > > +	};
> > > > > +};
> > > > > +
> > > > 
> > > > Make sense for this as it leverages sc7280 and adding it there would not
> > > > have made sense.
> > > > 
> > > 
> > > Why wouldn't it make sense?
> > 
> > It is better to add for platforms we know their firmware support this
> > from day1 and not add for something like chrome or any other variant of
> > sc7280 where this support would never come or not tested.
> 
> So SYSTEM_RESET2 only exist in newer firmware versions and hence this
> isn't (and won't be) broadly available in SC7280 devices.
> 
> That would be excellent information to put in the commit message, so
> others writing Kodiak dts doesn't feel the urge to copy this and debug
> why it doesn't work.

Sure, @shivendra please add this information in commit text.

> 
> > > 
> > > > Acked-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> > > > 
> > > 
> > > Please read submitting-patches.rst about Acked-by, and use Reviewed-by
> > > going forward.
> > 
> > I was acking the idea of this particular change in platform file compared to
> > other patches, if above reason looks fine, can be converted to R-by.
> > 
> 
> That's appreciated, but per the documentation, the meaning of acked-by
> is different.

Sure..

> 
> Regards,
> Bjorn
> 
> > > 
> > > Regards,
> > > Bjorn
> > > 
> > > > >  &qup_uart7_cts {
> > > > >  	/*
> > > > >  	 * Configure a bias-bus-hold on CTS to lower power
> > > > > 
> > > > > -- 
> > > > > 2.34.1
> > > > > 
> > > > 
> > > > -- 
> > > > -Mukesh Ojha
> > > > 
> > 
> > -- 
> > -Mukesh Ojha

-- 
-Mukesh Ojha

