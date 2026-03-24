Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDDC2F532FC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:04:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=; b=X2UuaqP00/If2MlcnLRYWsJQ6L
	I7z6Jwsd50JTSmP3v5wKsf/gKVU5PkGAKmDXpYjD1z5hrkeYVidXYfBjRY4uiS2byH77TWBjPkDxy
	IqYB8L8GrUZKleKCqn62kpyN1YhtPh3SUaBrLB5HPBoyWY4pQlCnVF6QM8n7EGQ7aDdFKwKQaNFzw
	o5ocg4l2xw15oVU54w1/iSDU4iokYrgnORm6gkl/EKPWjwidHblZjJ4Ed2cmgup7zPGpV7k1VxJpm
	p4cpyfKSeJafnnIq9IRXjo7nf8k9zZKYhHklPInqaXatiSR3K+Zo6kl7TxFQ46HuQ39nGWn3/B0MS
	f69jtGgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xgx-000000012c8-3EhP;
	Tue, 24 Mar 2026 09:04:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xgv-000000012by-2X8p
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 24 Mar 2026 09:04:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=; b=pC4hHeCu2BVc2h0LNUXYAmTrP0
	YztFVOk9ZnWUl/Mbn5XHHhsBw/6u9PB7srvlEKbg3qmU2HSvgYSiuYK3ND5kvTnUWf9tKHmvbAYL5
	8LEQ6Samf6snm4SMkiIGcjYqF0TQqrIGf+dZIiVl27dG3t7wzrNz4lTpW1zgMNHo7XBDr0mPhnzxR
	k724CkJNB1hwTF1F+z3NE0Scgca338gpdpyI6RmmjcV+V8ioCviZcw6hon+xA5u/ycdoa7R07naR0
	UwlQjxkXqN5EEyRTwr9zvfOSzJfmy8Q4d8HzG/Azr5kgUpTMmBPM7/49ZwqT1JiXXn1wsTnWkLb/j
	rdkqrTbQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xgd-00000003bHW-3KQv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:04:45 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O8xgHT2322865
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 09:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=; b=eobWxcRqzLnx6L7E
	Sf1sa9GOx1ymukjiv7nmvyorMZyFEEEIWs5RIwb9MhQ6f2z/otzZBsq8jJkDb1uN
	rVybLrcZFmWgBaVQEKfGaGdmCjqIkTL/rfzcAy60xjCyyad/DpMXyVq6ZdoG+0Ia
	wEQMp0mCSpTNigow6FiwQ4SnRpux5RaoBsg3nhVrZjRIxswYoMCF30A9N/gR2UrV
	nNnicvThy2P2BYx3zvbu6YRcY63WHOOlQBb48RRhCsPT5JbQaRR0lW1OF6ZzCZE5
	rnqUWAbSs+lrAlApu0Io40IGtc6+u0BehQY9LiRi21gOw2zrXLE0Ym/0KUY5enIi
	Bxz+2Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qker0qa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 09:04:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4076dc16so221520961cf.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Mar 2026 02:04:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774343068; x=1774947868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=;
        b=Y+3zl1ZWY9/TxY07x/uhA2zNIX7c1fp7+WqMn+ARzaavHvg847bMp7axNpJqog7J9t
         8yXL9vts2rcmP7ak9njJNIOOdsua7YADv9ma53LkxXMkFMe7UnlvicPFH0RYltynb14e
         hCUsiAORoLkkNS33cMWhxctLMap128P6+bALZxclRRjLsl+H+sMw7XSknPq/+YnTPrrx
         d8uWOjuRlKVvC2qUuDSms2BnHfKONv8F+c+EdKRlz8V4xqbMhdNCTpnVRqG7+SHoOoC4
         PTb+DkRKLwCDHICDYTGa8nNiW9tfTOtkcaMzkTaqsL0JFom7B5Bju1VbhXRzMKRe919+
         tYhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774343068; x=1774947868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WPfigo46/ROFQ4N/tJ88i4ZYjoNiquVe9blKzLVTqFw=;
        b=stPR4IWR84SAkwHkm5GJXhFdHB5F04HdaFw83Kqzlr5P2tMXR4eG3gUt/POWvkjAfZ
         cFaKCQ0l9wiiNL3wYCGTo4c1HcA1JPt1ogPC763VZ4d87G4RzWrk1l1C1ZQZ+08yDV8O
         0v0h+sGoSIgBLxknDXkLcgry43eFICkrgTmUb2Yz6keYqbPlgd7dRvkaFxjYtBL+rBwV
         /lkOcJQaKwI0tvzeIBNnmqkU7+fvo9q5dXcMEtyRJcgucJZcUSOAkL8H5QXAgRZa766q
         nhljT4OhZDiHlFNU84Zys2duFvaKJvK3ru2OY+7O4ZDMA8708j3G9cyOKTzDPXoojZxl
         FJSw==
X-Forwarded-Encrypted: i=1; AJvYcCWh1Fuil7GrO69q7gqCSlCS2i4Ng6yrkw+VFyJmt8dz75aL6O6kkRQtlghZGRpVn3ybVwhjqo7mao4exDgT/MnJ@lists.infradead.org
X-Gm-Message-State: AOJu0YzPFEwUoUtXYi2580s0B+Sl+6wudJIZs4Tu3T5SkdjVoVcNe8p4
	/Z7kBu16ryhvaETxR/nBYGggiANp9lFoOpySdm2APF0+cjASl449GrFT3eC2Dr27DRPivrwSRCC
	E/vQNQmuKjropeGsjYTUvCjWQoTXVtSCdDifM4Kfkr9TebhOZ5WsjqSN2VbgIxfXIPFyHWlL8nJ
	DXhQ==
X-Gm-Gg: ATEYQzxAn1gYxIaNVma3yqY8DC78F7epuhqiV+lf8mrw/iVMcelPPS49aqlDSzty+rH
	wbRp48XxqAr/yPT9IPRCc1O5TFkdYeB4SKso0ygzGNCa+oj0fASnFVX3zoL70dGG0PyJXmD+5a6
	Ps0Qwn3/WMZKHCRKB2CT3cFZ6iFAtrpiXdSSjyyqH6kyjciN41QdA7tgoj+kWM+gua2oy0WBUcu
	FcVOBY9jXG6vOWvA7NL/IJwoomU+wb53eVgLO7l/xU3XvqF8yhmNhiDl9tLET+xqc99wNkUnimc
	VRCYur21xeWUgpOaGI5KRYHmugXPqFogFmNVd291wGB51+EioY2Yooj9ER/zbYRTpHu83LOr/Y1
	62e51cc/akszYx1amJhagomSMVVwYn+J5wLbyWtJl3TCGy+vrczM=
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr133853291cf.11.1774343067835;
        Tue, 24 Mar 2026 02:04:27 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:50b:51e9:2e8b with SMTP id d75a77b69052e-50b51e9310emr133852721cf.11.1774343067138;
        Tue, 24 Mar 2026 02:04:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:99ae:5c2c:ddf7:d77a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-487116c086dsm40007565e9.8.2026.03.24.02.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 02:04:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Linus Walleij <linusw@kernel.org>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH v2 0/9] gpio: remove uneeded Kconfig dependencies on OF_GPIO
Date: Tue, 24 Mar 2026 10:04:24 +0100
Message-ID: <177434305814.8385.4412622204610388581.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
References: <20260316-gpio-of-kconfig-v2-0-de2f4b00a0e4@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Fk1PJTpJFsPtqM9sMMRTMAAWXIiF2c7N
X-Proofpoint-ORIG-GUID: Fk1PJTpJFsPtqM9sMMRTMAAWXIiF2c7N
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA3MSBTYWx0ZWRfXxmYU04nliXBk
 MUR589XgjEZIOvbN5x+TXGtkLBvFlNyM2jjiA/VvPpeIB/OYcQ8DuJjZGmEml3oP1Ua9cEHRRSe
 kLhfV3a+lkAWXT11nVLbwVF0HKZY2a0UXpq9GUGuxQl3WXA0t7YclQd1nm7dtYb2MSzX/YO1FZ0
 PIi769mM8WivEiUhbyj9Fo8U88gQFdSWR2khg3QH5ZSDSRvC1exfV+3yyS6sxxpI3Wvm0edQdLo
 pm0MvsM2HWjQEpvlvCYDKEFF/tyY9BQDjBYy1Yx8OPHYKHqZVEnj/XlRBjzp8ILCsxHj3/j4d9C
 iaMa16L/XvZzShHa1GKCiAKlUc/x7YmJGBlvPsiuLLBy218blaCO8GwZLS3VPJqqWln1JIe4Y8w
 YJWukx1lhll6XzX1630QGp58mbeAaHQ/3Ym9ffOCRpENiy3i2yRXPJNkuBBC1ZroQr5ELeDgm1h
 GyZb2mX/No4FHOu2DrA==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c2539c cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_HlkyUIfcI8kue4dcD0A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_02,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_090434_336956_321E187A 
X-CRM114-Status: GOOD (  16.49  )
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


On Mon, 16 Mar 2026 10:45:20 +0100, Bartosz Golaszewski wrote:
> NOTE: Each patch in this series can be picked up independently into
> maintainer trees.
> 
> CONFIG_OF_GPIO is a switch that enables the compilation of the gpiolib-of
> module. The module itself handles GPIO lookup via the OF-node tree and
> is automatically enabled on all OF systems. It does not export any
> public symbols to drivers. There is no reason for them to select or
> depend on it in Kconfig.
> 
> [...]

Applied, thanks!

[3/9] gpio: drop unneeded Kconfig dependencies on OF_GPIO
      https://git.kernel.org/brgl/c/7803501e5754dc4b295ab22b20562e2b965358ba

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

