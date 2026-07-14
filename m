Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F22AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 13:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=; b=uoZU2dlAnljolGMwMCL5Nfe9OK
	znOY5a5OrqvhtAiJVA5lvEr3OSyqZwqqS6eQ7LziLpX7rnTicAHUVGw3TG9jL+g5O5sJPL0U7w9da
	8p9IbBmjv5u5m1U3A/dafbwFz5SFDgIw6cSixjgdONi5DbnZb3ezCqfqYCRICLLRyTRKj/QlGj+xB
	zoYU03cf2YPDrjyFoljenccyebbk4fflDYOMpYC5J6cU8M7JwZCIlaiSV+2XLYDWci0Vn2/6puPA5
	RAxtuO+R7U4CCjZEBuiXdiP6z0qOYT1uUYL18epsZBf5HyOxDj+B3ELltmp/Ozh76EN16w7SscCDH
	yd4veMiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjczo-0000000C8aw-1WnS;
	Tue, 14 Jul 2026 13:16:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjczl-0000000C8ZD-1GIj
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 13:16:22 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66ED4OZp457565
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 13:16:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=; b=jeDP1noVY97TJJm4
	cIhajSXeAsAmHOxUZ5w+rrnFsmDqOKfN4qv1NciKwvl0a9vv59ESqt6/YuJgOXKd
	2U4f3xsKnro776B5eQXUkzzonn9zUj4EjUY0CcmNrVrEgX1hsU92QRCgcXc88Zk4
	AtF76m99A0GiWR0qvmuA/OQHihEj2e1+CtLRE0wEH12PxEsaH+fBoJe1xohiHUcX
	R229DzrrEXb5VIR1CijlNq+5VjsfmV0mgJza7rCEwLCI9oqIAHjuyOO3YurOejU1
	OXk05tjGT7idOG9xzgxgye2BrDtcmOkjjdNsDeOVdRx43SKY0RtvrJ1yvDvre5qj
	UD2uKw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0g2gc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 13:16:20 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8e934385db1so77221296d6.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Jul 2026 06:16:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034980; cv=none;
        d=google.com; s=arc-20260327;
        b=MbvJu4qADwuw9gWdeTZt+Ym0wpjh3FTKBEIgbeIvpSXKjt4HE1EcpCL5VXu2ttnDdl
         LR8WkUMZqJ2eZPowsUh4QqH5eJNBlE4Kt0BIesI5Dg+THJCLewsTnxyAKB9rukqO76OP
         VVox/rfS0rbrNNbjTECnIPeP6SPIHb87KRzAfXNK/EYGNdP0XpvSqBj+YGE4XNaCiNfW
         +eoNFGK1vXTxIqN+o9RStlB5p/lUmLp8mQ/nAagTqlwVJ9WntyNam5SlzaAgAUlhRu30
         PeOuNnfQWtlkY8jncw1/rw8cpMDVHVJ3/RPVL48AhhSZDxSb+DHmYIRlOQqYCSzfr/Pg
         0ewg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        fh=sfDgRDb3kHZGU9kB5LmGDzqtv2vHyFXZUu04oyYYw3U=;
        b=J8gOaYIS7V/3WvS0zePRrrzQSSuo0cSeff9+Qng/pRM02FG1SWjKRDb9PIfBZp07nY
         eCDpgCE7+WT8onyqoJqjr13YPuydqp8ke/PVSNdlAYtG4fFioat3XD28Oia56FmC9ldh
         OirAa/C+Zu8e85bkVa+hdffEms/Pgx/N1AZwnXdj5DqOBTil/GtcMDiDBWVzmX0c+ei+
         KwIQZp+eD5D1nNg+VcdLH9FJtNNx/4ikoLdCXDtwDwi0xASWAA3tz8WuHc8ylJSQg1md
         l5uADthEh9PYeXRwAk2VudmB//zWchktybK4rKRsSUfSp2dCxzsJZdViMxgiX1EAWdw7
         sghA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784034980; x=1784639780; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=DLasf7USpztGAleBQyL+294zYaECjJd5/QnuxFu7aoruo3Nb+UmG10jzaGTrWDZp+a
         ZNOIwqU+Bqb1yde6PA3aHXsfYZrY62Gm40991ZTq7zQ1rJCvvjk7MymJ/fFeQpLrCfaj
         ilaB/elqW8rJLjsJAzFoJ0U35p5iEHAvhO28upORiS8AoIVp7t9yCiSEmPTF6/5HYEQn
         13dhE8aZCJZ5WseBcGi93tx4nZqOvrz3Sbuf9AfcLueZS4uLUV9WFe7dZ0fsQaVSQ6TZ
         ydE8KKWi9CMqKkG9oGOVWZS8O4rztse8xgwHNdeYKaqfJ0LWVEwyDxwzJbNVTsU+Y7PY
         zr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034980; x=1784639780;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jd5DJDKksYD7YmBkR0dFjXMUrqs3kGnAsls6yHowXHA=;
        b=XVPfCIJtUekJ7GLKhGC88NkIYhu8wbLEYQ9yU8N+HBu6VZeMunTGcR42hKxKpNKvnp
         jXGGQOaChFXCUUN7NImfH/05zEJWkFWwFfCTtl1v0Zn1nqPHBUHHyB640gGrvybeaEHd
         4Q8LYTNy2ClWxItTeJwPL/kKWUkO83cxV5PFkjGvdK6QPoGP1NdGrTCSwhyRC1gyZKQb
         zChCQCRkKk7s+gC/9iWYU2Xywv9TwZc4LsxSjpJ1TRSRxwBof5A9X1Ge+PmKNbJqcBZR
         G+EKH0GXKarPPQS+M0832CDwL2wKBbCAHFHMW3Eqy3Aj6Io9m8sH+1A7xPPxHfYkN/qe
         wcTw==
X-Forwarded-Encrypted: i=1; AHgh+RriU4V06H6xzEknD/hdDHWxnUd/9ryJ/sOcqrQtWbEwp5jKxkkMF7BE5IDnnx/BE6yZICa2EHsluxEP326orExl@lists.infradead.org
X-Gm-Message-State: AOJu0YzhYoNkslNDSZxhr6Vr00/wRYV3V9nM9F2NDnL6+UCMkImz7q4l
	5GJGjr2u2adWy4oYMppW+EUygyTWMFbcOMZtdrw/1b1MG4QOIHOa/PwmSOxA+EvOSnstSgff3V+
	DVqk9XvG8OSBD4Kwd68Td7lJD3F05GJpQbFvp2KxzRI5WSPO0FTF8T6r0hng28FnvXJ+gjO9xcs
	oj2XqaeX1t2arMKyCjTeOGA+LpimgpV0ZoUDrJEDQojwzIpAIuU8Sh
X-Gm-Gg: AfdE7cklWg7VRmNUthH3VQDWmTmJuiMRSYw+GIa3KoGv6XG32m5IysJgDyGizK0VR4R
	IJOkOReD2FDk18OWRZAy5cBCqVqXs91ca0XaPafQuIGepIFJCBbJTXo6/242nkg8lZ0AbCNWDy3
	zBZUki74cjchMXU1K546yowxGp9aA1D1V5rQJ0UdxYeQxsESKaeIfl/RmlAl5NbRhnOEGN
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id 6a1803df08f44-90747d19fb5mr45880446d6.57.1784034979502;
        Tue, 14 Jul 2026 06:16:19 -0700 (PDT)
X-Received: by 2002:a05:6214:2689:b0:8f2:67bb:a37d with SMTP id
 6a1803df08f44-90747d19fb5mr45879656d6.57.1784034978901; Tue, 14 Jul 2026
 06:16:18 -0700 (PDT)
MIME-Version: 1.0
References: <d7f7e8c9589d937b60e43168845ab4fda15037a3.1783603600.git.michal.simek@amd.com>
 <ak_Eu_eQKalPMwo-@pluto>
In-Reply-To: <ak_Eu_eQKalPMwo-@pluto>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 15:16:07 +0200
X-Gm-Features: AUfX_mxKzpq6RPl9OYBnCrjfKgjOcnNPKcB_AjUZghzaf78uP1r8iO8ekjIwd1s
Message-ID: <CAPx+jO9KMcxnmt-wT5jaApj9p7s11B6eSG6K08Jt9J=-vXxjhA@mail.gmail.com>
Subject: Re: [RFC PATCH] firmware: scmi: Make SCMI arch independent
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: Michal Simek <michal.simek@amd.com>, linux-kernel@vger.kernel.org,
        monstr@monstr.eu, git@amd.com, vincent.guittot@linaro.org,
        Souvik.Chakravarty@arm.com, Alex Shi <alexs@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Brian Masney <bmasney@redhat.com>,
        David Lechner <dlechner@baylibre.com>,
        Dongliang Mu <dzm91@hust.edu.cn>, Fabio Estevam <festevam@gmail.com>,
        Frank Li <Frank.Li@nxp.com>, Guenter Roeck <linux@roeck-us.net>,
        Jonathan Cameron <jic23@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Len Brown <lenb@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Linus Walleij <linusw@kernel.org>, Lukasz Luba <lukasz.luba@arm.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>,
        Pavel Machek <pavel@kernel.org>, Peng Fan <peng.fan@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <sudeep.holla@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Yanteng Si <si.yanteng@linux.dev>, arm-scmi@vger.kernel.org,
        "open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
        linux-arm-kernel@lists.infradead.org,
        "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:IIO SUBSYSTEM AND DRIVERS" <linux-iio@vger.kernel.org>,
        "open list:ENERGY MODEL" <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfX57DXMkAT2LfH
 1Bhp+lDjN4BDvnOwfeta3F+ifeoSN40viOC6X2lqkbiDnJrYWPDn2xbhJ7BiaclwFjP+GgD0RjW
 tq7LhO52t7VDCK/t1UYSLvwTqXiW/OQ=
X-Proofpoint-GUID: OpQQTsjF47hnL8ZxzKbrJk8GATMkuj_c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDEzOCBTYWx0ZWRfXwxyan4jFVWdk
 xrSjPRbO6ts3qtfpB7ZJXu2U9q6NLBV7CZmw+CIaxZjQHPC7rjwwz7vnUURY3UMD46ybguxFPnD
 dnIxBq0S9fD73qG0/j4Yu/fe4KbvdjzLPOarey/4MWwq2f0Hpgf16Ta2opwz2a41BJxcfqNtZgb
 2+K3BJ8Obcx5ZKDVUT/VxuFZKzsSOM7V/222MBPRyaO09zV9q4QD/UZ5VzCR4wQCa4nukcbo6mc
 7wPXSTbd+Gmf/BG0oGaZc4sLjsUMmDO2NDW/DdYoNohDgGDJ4DUzemg814rrA/w/EXvnaupRZeu
 64MqH57mFjEJ6aAD1pEeq6f09YZ5u+CUt5ZSWQx7LvRfSBfueMyRj4w+NNGfgzHnAQWUdweZ3k1
 bTN+kPxfbagYBZtEPMaViBx01wVQU+MhZ45lAhB3tm3sazugOko82+4EP+yVTXzP5GOAR93kUGk
 /Ii0F61ORXlvWTJmUQQ==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a5636a4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=7CQSdrXTAAAA:8 a=K75D1l0-MnsISjLg7T4A:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: OpQQTsjF47hnL8ZxzKbrJk8GATMkuj_c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140138
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_061621_366808_B11C52AF 
X-CRM114-Status: GOOD (  25.33  )
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

On Thu, Jul 9, 2026 at 5:56=E2=80=AFPM Cristian Marussi
<cristian.marussi@arm.com> wrote:
>
> On Thu, Jul 09, 2026 at 03:27:00PM +0200, Michal Simek wrote:
> > On heterogenious systems like AMD/Xilinx FPGA there is a need to talk t=
o
> > SCMI server from different architectures than ARM that's why remove
> > ARM/ARM64 Kconfig dependency with also remove ARM from description and
> > rename folder to reflect it.
>
> While I understand dropping the dependency on ARM (I always wanted to do
> that and test if it worked at all on some otehr archs with QEMU), I am
> not sure about the whole renaming party ? why is needed just for
> cosmetic reasons ? it is at the end an arm originated protocol so I dont
> see it as a being wrong to be named as such even though used by other
> archs...I have not really strong opinion on this...

This is certainly not my call to make, but I have to admit that I
fully agree with the above.

Usually we don't rename files that indicate a legacy platform name,
just because a new company/platform wants to make use of it.

>
> ... my concern really is ... wont this full scale rename simply generate
> a lot of un-needed churn for future fixes and/or backporting ?

We have some git magic to overcome most of these problems, but it's
not always straightforward, I think.

>
> Thanks,
> Cristian

Kind regards
Uffe

