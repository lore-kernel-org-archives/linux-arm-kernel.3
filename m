Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96245C83F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Jul 2025 21:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSeneYubwoKFVumkVWiLXeNwksNpoI4nzayH5GcuL7o=; b=La//VJEQhBY/HSxLvEVTQ/IXss
	AP37lHW7FiYBBnJhLnGOPw9o8m02bJKIPc74+gU1f3cojD8UIj7cuTxy/kxYna925IxUXfGPtpO9l
	eFlRdXYsmUzgDtXoKrwBaMdRmxzuByjrGeyQcCtpBFpZE6yucA90bcc6svbTf0dQBLBe9tsjUU5gU
	u5S6vikn58lL1gCpuA4H118q5KhDPOUfkK5erq5l0L395A3fTWk9KYkkPf24YP3xaBZ8+3MQMYHJU
	76HOi55tp29eBmhk9RYNgEVpN6psNyUkZgmBTpkwhsy/XFFfcagnPfVYZxaVh5JBPIFByeBlOzj/7
	J2/VMrqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyES-00000000kfS-08oN;
	Mon, 21 Jul 2025 21:39:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udyBy-00000000kAt-3U8o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Jul 2025 21:37:03 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LIgA62003812
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 21:37:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XSeneYubwoKFVumkVWiLXeNw
	ksNpoI4nzayH5GcuL7o=; b=a7Cs9nETT2sN9EK3jsfH7FtrU8CgqAwo9tVFk5g0
	wkb797A1k4AlBoloSn2mci4IjK6bVR4nLUcJMJoW0kcMlwrHd/syVoym51qWUjAk
	yZ6iNu3r0vS5nyOkIgN/8TDWRUsp8AkaHAiUIpHcY/jTL92mql8ymbDlwGfE6Q76
	SemUdAD3yHBaa4pbrssgNQVPIc3rZlufh67xn0ePJfENPvCM0lnDdskEdqDPWwbS
	tsScXZ+hTuN2EeoE4VHOWwPt5g3Imd3QBFzsvr9ptfzliRw8B6jCPAygPjRcuiKd
	B+vjlF0AESonxfs5SYJRw5bra8wmqp21quhvVv5bNlu69A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48048v5k0w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 21:37:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5bb68b386so1450216985a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Jul 2025 14:37:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753133820; x=1753738620;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSeneYubwoKFVumkVWiLXeNwksNpoI4nzayH5GcuL7o=;
        b=X/L6UdfC7YIni+AO9YadafCJDEM0o3VKBXhe6Lr/ltJTsn8N7WcbyD6qUOFDFAfhGa
         IP0jjVt9n6r/jpaMR7sxwGbguLTSNSy9uTek496s67BKqYv+mouissN5gGXR4JOUAXiK
         tDzA90DbNqUO81xojx41C1npbG8mAjBWyFT/kF9yGzD7fiTQAEJitF7jWamQMRxbgovN
         YTDS3fQGQJ6SVZb4SpdFIRBEN64nRV+ZhK2nXbdysDp2we6jZ3Ne/ewIYbl/TcTWQYI2
         aN9r8tBDKhYKr6Qj401ay+HEe4m7nXOUjzVhSt4l3v1CVWWx6/fXQh3w4HkA/ejurftD
         BpXw==
X-Forwarded-Encrypted: i=1; AJvYcCWGBG52Tf4iWTWNXiJdhDICUnrIZe7p6H9GoYKAVLNjwrXwLHMN4s5uayCOMl2XQSFAIQBl1IqQil0S0/Wr7xkc@lists.infradead.org
X-Gm-Message-State: AOJu0YxXGDGLjVbTjo7qyDu6DW5/QAx/GSMO+JO5y/DQEBmnOyuaJ2BQ
	30VzucnUgZP8DLb+UxN4GTjffhCflfsncDhAWma5W/w3G+tBdFq1J9LhPtYrV7h6LBxSU3Quz81
	F+uOd5A/TiYlPlaCUW4hYmyUS1QpqUxfEllfnvFN9mv0OgpfEHXGqutWCA0rxCaG9SXecHaHJ+D
	b/wg==
X-Gm-Gg: ASbGncubQnF/ue00U2WcCAgYuKfi4/3XFmspue/mvCdtjeDu7xUyoCg1k+Vd9sjjmqw
	9HfUFCvHd26LSnQxbb8inAj4HrWMnJE2h0mdfQWgyZ+x8n0FNpXvdiUKzRbIPMCWUYzB7LEKPYX
	WwibuPm4MIuYTsbpmr00AgR6tTWRinP6hfFqYPy97FGKWmL5NNxLjUw8VQHTq26MvYW95NbIO3Q
	cSeFmIMFfxyvAga4FtL70pkovPlqiDLC85RrChuO/9vBRKA8ZhO8GYjK1KOybORzkfdSWX8jV+N
	npufI+52aik4D60B5ee14XJf+R2eXACR+6VFimwYvKH1Z0HstafCql9p6rBwOMPbizU6tPsjvpq
	gpW6GQpWWbfFRCUQRmIGG3HRPKcnXd5FXIkEH8nLvMZd3657kLh2a
X-Received: by 2002:a05:620a:2852:b0:7e3:5129:db49 with SMTP id af79cd13be357-7e356b06e5dmr1803435185a.45.1753133819879;
        Mon, 21 Jul 2025 14:36:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFF4jT0+GbYEvvHgqyFvbhxqSYTWAMQbDApGgQWdExppcPmAG6eo15SkHyeIVhHgv8/4M2flg==
X-Received: by 2002:a05:620a:2852:b0:7e3:5129:db49 with SMTP id af79cd13be357-7e356b06e5dmr1803430085a.45.1753133819325;
        Mon, 21 Jul 2025 14:36:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55a31d7c690sm1698974e87.110.2025.07.21.14.36.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 14:36:58 -0700 (PDT)
Date: Tue, 22 Jul 2025 00:36:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
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
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Andre Draszik <andre.draszik@linaro.org>, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <quic_eberman@quicinc.com>,
        Srinivas Kandagatla <srini@kernel.org>
Subject: Re: [PATCH v12 1/8] power: reset: reboot-mode: Add device tree
 node-based registration
Message-ID: <33gq4iyx5jxrr6f5w3ctgy7l7om53jdvb4tmfmxzourhfvpc3t@cr5re2dab4tc>
References: <20250721-arm-psci-system_reset2-vendor-reboots-v12-0-87bac3ec422e@oss.qualcomm.com>
 <20250721-arm-psci-system_reset2-vendor-reboots-v12-1-87bac3ec422e@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250721-arm-psci-system_reset2-vendor-reboots-v12-1-87bac3ec422e@oss.qualcomm.com>
X-Proofpoint-GUID: 9OFbNGJnBNJi_XgesDfei4_xyqIYBVUD
X-Authority-Analysis: v=2.4 cv=SYL3duRu c=1 sm=1 tr=0 ts=687eb2fd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=1bIxdRCwe99oYZTV_csA:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIxMDE5MiBTYWx0ZWRfXxzP0cO+6JaWl
 fkMNEEFdhMPLBosDtVKLz3M3/FLQJQum4WGm4AYUEkC3e6XnzundNSddUjn59N2k8gDl1AYsWCJ
 CvUX08pZrOzjF66/Rkw6Q5E5/fogJ++HEuzNF3BUU2/N4E+hProzE2qXvgPKRbccvZKLbfSRuyY
 YXVxDbUOW+FmmnQl87GLRKmde6nagUAyj+cfnkhZHZTGbmYqzrGxcEJQxfGupKf1V8x4TmW1oxh
 6sqpBVrjCdJ3hYggTM+spx/wRZEAfz95uBGDPbY3oQ/kzLqWdVS+av+S/PijCZ+IzURjdKIve/6
 pamcCTsy6AjJM0DjKXI9NIQ97Jm5fnxovVh2JQzoPfPvUUuOoo8/z/4/V5VkMvnc+2Dit9n59H6
 zwZ5xfej2t/+AXfQ+4VaXIy3KBgVkNj6wsQDMpDrjIG1E8bA9+3t+r0dtMHamwfggZM7EUwr
X-Proofpoint-ORIG-GUID: 9OFbNGJnBNJi_XgesDfei4_xyqIYBVUD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-21_05,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507210192
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_143702_880755_718A8FF8 
X-CRM114-Status: GOOD (  25.58  )
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

On Mon, Jul 21, 2025 at 11:58:48PM +0530, Shivendra Pratap wrote:
> The reboot-mode driver does not have a strict requirement for
> device-based registration. It primarily uses the device's of_node
> to read mode-<cmd> properties and the device pointer for logging.
> 
> Remove the dependency on struct device and introduce support for
> Device Tree (DT) node-based registration. This enables drivers
> that are not associated with a struct device to leverage the
> reboot-mode framework.
> 
> Signed-off-by: Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
> ---
>  drivers/power/reset/reboot-mode.c | 45 +++++++++++++++++++++++++++++----------
>  include/linux/reboot-mode.h       |  6 +++++-
>  2 files changed, 39 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/power/reset/reboot-mode.c b/drivers/power/reset/reboot-mode.c
> index fba53f638da04655e756b5f8b7d2d666d1379535..5dd3f06ca88cb28606d9fd2100ce03383c14d215 100644
> --- a/drivers/power/reset/reboot-mode.c
> +++ b/drivers/power/reset/reboot-mode.c
> @@ -3,13 +3,17 @@
>   * Copyright (c) 2016, Fuzhou Rockchip Electronics Co., Ltd
>   */
>  
> +#define pr_fmt(fmt)	"reboot-mode: " fmt
> +
>  #include <linux/device.h>
>  #include <linux/init.h>
>  #include <linux/kernel.h>
> +#include <linux/list.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/reboot.h>
>  #include <linux/reboot-mode.h>
> +#include <linux/slab.h>
>  
>  #define PREFIX "mode-"
>  
> @@ -55,7 +59,9 @@ static int reboot_mode_notify(struct notifier_block *this,
>  	unsigned int magic;
>  
>  	reboot = container_of(this, struct reboot_mode_driver, reboot_notifier);
> +	mutex_lock(&reboot->rb_lock);

This one should go into the get_reboot_mode_magic() function, otherwise
it's not obvious why do you need it here.

Also, please split mutex addition to a separate patch.

>  	magic = get_reboot_mode_magic(reboot, cmd);
> +	mutex_unlock(&reboot->rb_lock);
>  	if (magic)
>  		reboot->write(reboot, magic);
>  

-- 
With best wishes
Dmitry

