Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054E4105F7AC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 13:44:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=; b=tx6W2X9341T+PGz8MXCbjAv5DA
	Y1RHd/Wph/cKsmllNZMilFhMF+H8lnwm9LM27C1V81Y1OHavkzbRKbh6F+488nuxNsBhh6lQ9YY1/
	8UhXiyNRCWXc/h4csnMmAeB4TaVAMAGrgEwpTWol9FN8Z4+3tdXvF36jFzOQAwJyhXbQiFTgQ4GYe
	SO2w5+JQNTspk2CYogZxU5of5suoGPIz2yZJOenERBhlGd5Xrin+LbB+fKTgCgeYzwt0J2uR+T/FZ
	F2/brKZmfIwXocRPLw5aRrn7aqALOXWsYAH5jCKpbNmalcqRVAMwNd/1QCgX5SRqd6up99V8Kr0o2
	q16ePgag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12oa-00000000JML-0PSD;
	Fri, 13 Mar 2026 13:44:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12oW-00000000JLU-0jKp
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 13 Mar 2026 13:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=; b=d/ILotqr6zpoTdfOiQ9ZoMJHSy
	MjNDAYNRBZ1LSX5bTUK1Frllh4/3ELsuhiJJMzTkawWjRJY4Jv5thpc8qEYYPdVI+KxTvSJqr9xq+
	k2UdmCTAMe/A2+eLbMG6L0mD7/26pbEspOkV8w0oVuhnNDj4YUeMeoDomdL9gAw9989lYjG50QVLM
	Iv+3HzKM72CzKWMe59X8pVHwJy2TUthAIz+CZtsTU4AeGLar0oixjYbH/GpPo/HOvU0l9pJnXPDlS
	6AD2bwyF9RNoQXUV15r2VfYl2DQiH+hmFZpnop5B4NuTIJoPxXXa+fM2pjmo72P4E0XZpmD9Fryec
	0y2liZZQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12oR-00000003QgQ-2Ub3
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 13:44:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62DBtwjI3229811
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 13:44:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=; b=KtbSMsLtNsll432M
	ZTzKQXe8T/DK/n7b9XjI6u2X8hEFxS6+vToHFGAIETMkOYmiyrVQx1Ron0HTNUGw
	L/7hqLNFcZtO+7ieK6wWqj/GrMcUMTkirbNDQOXKEyEzX++Y07x36vS4BckJkiBw
	i0e+TKFjJYkL6k4y12GD35M2kL8ToRgaS6v3aDis+sQW046oTfw6VRUKYvC55XyU
	GavC+gmfdoZZxfCSN9TNUX7z0/IKdGFuTV1BuxzhmfyaKB9OzNJ/1nmkV5iIg9BW
	H8cIWU+Z3DaF7xCU6hevUNHgxDD88Y9uGNl2srLPZ4lN68ffEs3Qj3IQtVVXyVOS
	oZVnQA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cv8n7jc07-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 13:44:14 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cd849cd562so1384294685a.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 06:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773409454; x=1774014254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=;
        b=bjkqoJFmhJF08aXIKYUh6CpBZOzDjmzcl41fuAhI8jqtfc2tUfjCBJOz7hi26UvMuY
         8F9kzteCq4v2FV3Psb3L9VYu6M48zc9NQn6WpZWJ1ttvI9hrRjXlRceC7P8X+v36irS7
         YAWF06Jk9oX9bQ1URDw0+DGfMq+F6Ow+uAwyQ9TPNOietQBtOOFgu14aR9b3Czy2M7gv
         ZF7ZqsH/MVEpJWVocgUti5Ws3dgmNASXlruek51vTB4dvU2MDiTuqAYyZDrRuV9TG8GC
         J4fgNUNml1TczIOoAq0bIUM6s7UQo7ibS5jHHTAVo6+MVreMjBBk6xhChi3bzsAG43kl
         H3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773409454; x=1774014254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QoZHIkugLvxBFz6S6an3vh8XxLW2VljccTx776RcMfw=;
        b=aaL2N3BCo3fk+J1rWWGBgL8CjAheKGZOatT6GgDFyeX4C0X6Zjpryi9G2rT68ejnji
         g7TGR3MZWEIJp796LZrAGu3vsMtKehqpiREUO5NGddGpUEjy40vP2c9631g46/VrEcf+
         neuzRyBo+nDXIT+HRdvWmqG8/Qgoozn6ROjmcSnG+65B44MHRHT0DnN1cgGiXDpdwJ+6
         475cYOIGrpNKoEJazIzLlFGRC+h3ZWJLq+Rbitt3jFPE7+iK+1M3Py4Z/WhP+IMkYas3
         ot7zrs5kxIMM0e7sWwirbJIIY43fBzeSdDnPR3ZO3UiEe1AHvjs+ijk0XQRv17DGKWTZ
         24gA==
X-Gm-Message-State: AOJu0YyTLKxEoWKmU+5JAaTkb1GkGJ2KkFw3Gmsa1K+C0TC5DCAWPgnp
	9Htn+P8gJi2Z4Z/zRwG2N5v//reeZ/lLjc+U/6cMJQ5buTZC0SzjkhsPGFXWMT5b4AOQQPRDfcL
	OjNGxHjcVjCbsDh7bospLqV4talUgFf9MHvNmV2Od+gkQktnMcGY1RoVoJAsYk5Jl143FukbLF0
	5MFw==
X-Gm-Gg: ATEYQzynOtX5RuhfTtNKhRlus4PnLfzuhgzjWNj7q3OzHrGPhrrTMOJdokhvqbJpzbw
	doBOfHK3zD2LZoWB170ttl9/6xpJvC0d6iuBS6ZHwwojakE4/ZjCr6E1Pp0PQ4QKI7tzCUhZJdS
	HvdV5GEBPJArusSQ29xA1LNA7e8JlfxeCt0INZuZ10KocnsVimvZD3kJxstNzHcFmAo9VElW02E
	kudCRwYPjmsYWTNcX9G4u8H/8DpdYikYSLi/7Lwqh/l+8zPjNFtCk/95WACQcQaA3y7xH6H6Qgo
	AZWbGi4b10OXPqk9QID2oT2I2XUK5QXX8B9YgQ8JLQk+CX5L78wpgADqYCsLQBtpfhpHH2dXD5P
	iqRY5vI/kuFr8oQ9QvBSOIE0OvOQJ/Ptq7IHYoJvMBg9TmC5lunQ=
X-Received: by 2002:a05:620a:4623:b0:8cd:8fb7:7aed with SMTP id af79cd13be357-8cdb5b5fb55mr457720285a.49.1773409453963;
        Fri, 13 Mar 2026 06:44:13 -0700 (PDT)
X-Received: by 2002:a05:620a:4623:b0:8cd:8fb7:7aed with SMTP id af79cd13be357-8cdb5b5fb55mr457712985a.49.1773409453455;
        Fri, 13 Mar 2026 06:44:13 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:f055:6536:e7d6:661c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20b4dasm17696873f8f.18.2026.03.13.06.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 06:44:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Alexey Brodkin <abrodkin@synopsys.com>,
        Vineet Gupta <vgupta@kernel.org>, Scott Wood <oss@buserror.net>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Dvorkin Dmitry <dvorkin@tibbo.com>, Wells Lu <wellslutw@gmail.com>,
        Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sebastian Reichel <sre@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
        netdev@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-amlogic@lists.infradead.org, linux-leds@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
        linux-pm@vger.kernel.org
Subject: Re: (subset) [PATCH 00/14] gpio: remove uneeded Kconfig dependencies on OF_GPIO
Date: Fri, 13 Mar 2026 14:43:53 +0100
Message-ID: <177340937994.51547.9424773605486301589.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
References: <20260304-gpio-of-kconfig-v1-0-d597916e79e7@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: aIViKrLRMVQh5giJotpcgLzeTRYrEyNf
X-Proofpoint-GUID: aIViKrLRMVQh5giJotpcgLzeTRYrEyNf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDEwOSBTYWx0ZWRfX8EU6QmFR+Fbj
 QfpeKcKKtQmTV8IRsAo8J1bvU9JwrAjvup3pOTO4wTafv9JzkP+4LfhLSyVPwSRcq9OM58cbk1K
 ukywXd7WsQHAGgLwuNYlV2iTkQayfAI/sU9T2Mes9RTJhho+9BgqivGVZcfqpjQ2pae2w3m8my2
 I4eulVrgc7A0Tfvb0IQAWVNawnK+NnqJiydfXlGH1G4YJD7I6uEdviiiJC1DbZxrxBjiAguyX2D
 smJmTWtdDH4wc7ba1siSH5sCAs8YjfaVSs3+JaMbkls4IoICQz6b5PJWGZMSreMGhA6xQejct7E
 AQMB5wxPsa2bL4XHW8veMaTzp+YSGpGEHKZPdTDCVya9i9QGIzsGZfuNmvbQ4uJgTTj0DmqTnlM
 QAcdDU/jFmfoy3WMg5oJnXhvw6nPRS9yZ/uOOkIu26pqw9s7VWozPUKEoEZzjxa/e1efHh8gNCC
 wB0TccpJmCKDfKrEVmA==
X-Authority-Analysis: v=2.4 cv=CpCys34D c=1 sm=1 tr=0 ts=69b414ae cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=5BVL746LnNak5i1nQvMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_134424_942085_9BC126EC 
X-CRM114-Status: GOOD (  17.14  )
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


On Wed, 04 Mar 2026 10:02:21 +0100, Bartosz Golaszewski wrote:
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

I'm picking up the ones that were acked and will send a smaller series
addressing the issue pointed out by Guenter.

[02/14] arc: axs10x: drop unneeded dependency on OF_GPIO
        https://git.kernel.org/brgl/c/d2cd20f7c2a4e4bf4fca844c01e925b112c5a2c5
[03/14] powerpc: drop unneeded dependency on OF_GPIO
        https://git.kernel.org/brgl/c/dd1cdfb20e44e295512080dea508771b6a1f1c0a
[05/14] regulator: drop unneeded dependencies on OF_GPIO
        https://git.kernel.org/brgl/c/bf017304fce10933f18fafe140bf749fb9672058

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

