Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C489CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Jul 2025 16:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAVDu2CUO0GFbPnrkds994cc7fuJHUyL9s9URha4+gw=; b=qAm29hpQD3LAdxislFFKxOeAZx
	a4OL3R5q1b5OSHljZSkGDzw0apsZ6Qfdqyxuv6ThHlrVlX8qenHBHA1KhwxQRg6+r69g/eMrtJUCM
	BRMzthfdSARLnxsa1igCwN6gAgRIn7Me7Y6EAvlZb/46bqqN6BTjn+Ki0pgpOeXLTyENNxvnwUVpX
	j2a4Bf32vDpyv2LvFdQG0rX6Su6NdPY3y6RRT1i25H7iAu1+VWqJDtSdqsNp3/PzjqnmN/wbNKY8O
	kuEKWzhDsfL/8HPFoFlZhhL5LueFf5M9Kzp/YeC6XZ/4VyfbWCR3cDPZFrJehlfp9AWILANNRMEGz
	Lu1X4fww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugQnb-0000000EzRX-0XGE;
	Mon, 28 Jul 2025 16:34:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugPui-0000000EqOW-24L2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Jul 2025 15:37:21 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlJCq004983
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 15:37:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=SAVDu2CUO0GFbPnrkds994cc
	7fuJHUyL9s9URha4+gw=; b=Pb4XQpKeNIn4JwZo9QYgwyN8jt5WS7p27L9R+3Lv
	sBtDiOW2Yj3IWvwog0YlaLitsHCvtEERjgFKUEmhcM2VYrShSsoXJxVs9Lyp/qNn
	IQxNwn/xAdqBPLO8GpxMqliRmo/jkULpDDIACh9KEQSiD7oazMMV6NifxQTvnojz
	/PKWqbcLiZlWdNJKuyZQQv48DZQ/PpVLP4c9cE3NGZcSSU/F1JL59EoW0p26G0ap
	YCblv3wCsjP5zLhMFG1F0wPZfL/xiGBIXNxICmXZ0zayCQwUFW25an/BgEpyae56
	CTXQILbgTgVRaiCSFpyVsGFpnU+2t26xuAejBlnG8B20CA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nytw8eh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 15:37:19 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-7073b4fb53eso24844926d6.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 28 Jul 2025 08:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753717038; x=1754321838;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SAVDu2CUO0GFbPnrkds994cc7fuJHUyL9s9URha4+gw=;
        b=MmT0aWhjUh3kCCR1W4qj5egH15y8KiA1sJ0AQYlFnfJz/dzr3lvdQwVT1zXpOmHozc
         D5utEBHPsbYNdbcxWXs8xV/x4MlN2NBL1jwQVGrKJp5m5NAGQWvXuwZIUaIDPtC+gLdY
         +Ppyh8Rm7YiX0qCx48GxRqrD819oyNlVvNgwCKRuZw7MLORgpH3/jUGddQ7ce1HRbq9x
         anrHQ0IjU12RpQ0w0Av7fB+eyE0cJlBSDP2NJwqBZgP1z6lg+NE6eOiD1OyFcIr/DYbJ
         014h82qfLKXozPRJtfQLf6BGUUwc+zFcUfI7bHSvse4oJymEKTw8js62knfb6toTBjKR
         U+Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVZiCVbNTEJvgpFptqgSpLG4mTmWjjhIgO2U6B/nEczV/BNh//bSPRClZH53e1w5Bp5cPrpVX3ncrqCjq4HKeu4@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu7pkOStO7zZpiTDlA9NW873sUQ8hiTfuybqddvu43UMMmQLBf
	jFvzMBLAHYcwjvkGhHe0kUuXf8681aZFyZtPrGSCCmY+M+fUha/X0HVj/1tVhJ43s7oFU0vMrDd
	XSDVz6/kAtywEvWsfLwKlGls4+50pDWicWMpoYAOTJeFWAhX8ce6amcwEtXiLquRy0mHh2j/GkP
	1Eig==
X-Gm-Gg: ASbGnctPI1GhhIXj5VuHKbND67d/TvDteT+lTXxscu7SF33x7i7+roVj/Ir2CFZ8b0I
	euPFvlKg2CShwVFU+0kRQUOim07pBUl92B2syn/aCvQS0DZLRxYO47WBhBpqeIIzKeG/czCLsZi
	UZiIcQ6QniWzI4NSsEoJ40RrmNVcCh6e5g7u+YyJmQL5apfng/nHyjjQsuYqQIqH2+opbHl0Q3Y
	JwJtWoPeb18Tra5KZD7sIoTI0bRMg33d8wtvbXRFJ8DM5N9Ok/5hk04v/jDYoj5Ar8OoSwhuR3v
	XRc8ltNCtST57NYVDdPmFgZtKbM4MvG08IGhUqOkEsMGi4gXiHaC3+7aDPe3fvrCLy25MlIQObq
	IJfCvQ0ek+X+Bqo2eUCZHZyef5DSRaJvedOiKlrQkspixhGXA87Lm
X-Received: by 2002:a05:6214:768:b0:707:4aa0:30b with SMTP id 6a1803df08f44-7074aa00690mr43615696d6.42.1753717038016;
        Mon, 28 Jul 2025 08:37:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+BWhOHv+VJeM/lHL4P6XKb8rnJZC+uPnNDX7+Ov1b4lYzmfrK08Z/Q+Kn87HxQgfASQl2vQ==
X-Received: by 2002:a05:6214:768:b0:707:4aa0:30b with SMTP id 6a1803df08f44-7074aa00690mr43615016d6.42.1753717037278;
        Mon, 28 Jul 2025 08:37:17 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55b73f140fasm21169e87.113.2025.07.28.08.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 08:37:15 -0700 (PDT)
Date: Mon, 28 Jul 2025 18:37:13 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
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
Subject: Re: [PATCH v13 07/10] firmware: psci: Implement vendor-specific
 resets as reboot-mode
Message-ID: <mfxfi3blmebuua4rwdppbaiyiyqh7apkh4xxlwqm6t2ishjqfa@i26nvsduy5wm>
References: <20250727-arm-psci-system_reset2-vendor-reboots-v13-0-6b8d23315898@oss.qualcomm.com>
 <20250727-arm-psci-system_reset2-vendor-reboots-v13-7-6b8d23315898@oss.qualcomm.com>
 <b81aa592-a66b-457b-9f42-df4505b28508@kernel.org>
 <3gtlf5txxtioa5bvo6o467jupyoam4hjhm2mdiw5izv5vbl3tz@drndgp3tcrgo>
 <bcef34c3-98b4-454c-8138-c73729e17081@kernel.org>
 <5e2caeb7-360a-4590-a36f-ff1ec4c20d31@oss.qualcomm.com>
 <2a39c0ab-edd4-402c-95a0-a6286f03102a@kernel.org>
 <20250728-exotic-armadillo-of-upgrade-fbebc1@sudeepholla>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250728-exotic-armadillo-of-upgrade-fbebc1@sudeepholla>
X-Proofpoint-GUID: iBus4qQTw_euKiLmx9UJ5hFhNlxzGG1Y
X-Proofpoint-ORIG-GUID: iBus4qQTw_euKiLmx9UJ5hFhNlxzGG1Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDExMiBTYWx0ZWRfXzO7/pDnF1jvt
 IW312+T1gzW3NgeqlzZ/lANSu8m6Iv1khztT8EeuHfAanj9HYt8zn0ush6l3AU8gWAmgT/7Rs4K
 uk0EGDg94mFj6Bgzts+QBf9u6BOjVBKud1Qm6xkh/qOaNgQ/W7B5HZOl1svE+XlTTpxFm6hS86V
 mAbKscvRHfsSJ5M8zqHNflibmIitbCJpDebB4XHp4HQnl6U/jxMSxAoJNtVPoH7HAglo6Ll/Ove
 W+jSbeLU+cN4MNiSq/o6PJTVUbFR8QDxsxK2FW1/aFrcdNVsoeARkL/rqmCSK/sWeLrjv5Bo46z
 WrHZy1twhXxqof2B5a7JJ3VETSWOrSMo0z+SVWYdFNH3P5KFE4qKF0j5gB0ERvu3awK3fmSiJZk
 NADLmWmxxePnZdDxOdYaVtLTN6OePtWaYBNPwzmAMBk/QWCWLXXlka5Cl+KDXIv+R1HhAKX7
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6887992f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=-6XmDZydnhzWYMP6MwkA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=730 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_083720_542146_23D6E6AA 
X-CRM114-Status: GOOD (  20.61  )
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

On Mon, Jul 28, 2025 at 02:23:17PM +0100, Sudeep Holla wrote:
> On Mon, Jul 28, 2025 at 02:23:14PM +0200, Krzysztof Kozlowski wrote:
> > On 28/07/2025 14:03, Dmitry Baryshkov wrote:
> > >>
> > >>> and the reboot-mode is defined in the
> > >>> previous patch. So, I'd assume, the path is defined.
> > >>
> > >> As I said, path is not. only psci/reboot-mode is.
> > > 
> > > Do we have an _actual_ use case where PSCI node is not at at root node? 
> > 
> > Yes, many cases, because it belongs as well to firmware node.
> > 
> 
> +1, I was about to make similar comment. /psci predates the formal push
> to put all firmware related nodes under /firmware, so /firmware/psci is
> equally possible path and should be recommended one so that all such
> firmware related nodes are contained under /firmware.

Ack, thanks for the explanation.

-- 
With best wishes
Dmitry

