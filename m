Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05CAC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 10:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MWzDrNxzthWPdsVZldsnWvMx9IcczP+HYo1LJtEAQps=; b=QUeXjVen6L59udWbxGmq3Vv4IX
	476Tbw15ljtcOedYOqKfJJ7Q49Df5VBhqX2MXIiQN5/rmd4GERoXxJjCkF12hv04WXYoZ7PqlRlMY
	QNRrKkXj+bhauP8GpJJ2lO5wEykRCFZ5s6NvUFFT/rZUWrPGkX7/7ft9lH2iyMJn5z6wQ1O1iNHJ9
	aDpgTKx1TJMC3A0ItI9zi6UPn9RaPeiY+b6SDvryAqzhX90pIdcxTXrmwR0hGSiPGMwqZcDnjLEuL
	pcw6V9DGp7t8DvlYk7j2mGU5j37/Cg0ZkgQGQxVYmsnL0ynVJHDNZC5HRuTK/nuGauxtc13y23hgr
	K+6Hizow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24al-0000000H4tx-1o6U;
	Thu, 03 Sep 2026 10:22:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x24aj-0000000H4ta-1ncp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 10:22:46 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683AHABM212406
	for <linux-arm-kernel@lists.infradead.org>; Thu, 3 Sep 2026 10:22:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=MWzDrNxzthWPdsVZldsnWvMx
	9IcczP+HYo1LJtEAQps=; b=E/t0/AIQJNXxavIvF4DSXyZj0XFMxzjyKFoBboju
	8R6N1Darux0BmyjgQfyvsnYAbW88jDZ7/pMCxRBwQq73SRc0dKaeRXwoRvx4oU69
	xYnX4LRp+pFaJqQJ/hXZWq7B7/KqK4Haa6o6ClZv4ZzJbrgzFYLuzG86M4ivfKzz
	XR466xDjYKLFSGmrfvDG21XyL4wP9hQxCmouI8W7tvI6qYo6XovD8cD9inVfgmqg
	Nio5fA/LHms+iuYTVX9x1HgmlOcKicjFFZhW8nA70nFniMJ5/CFchnI3w7vE1sUW
	3To+/4/ZTDrHbDajvLFfE0A2Tc1w10AR+/bJy76HS7MFVA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1pyhdv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 10:22:44 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9308eafb465so570247285a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 03 Sep 2026 03:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788430964; x=1789035764; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MWzDrNxzthWPdsVZldsnWvMx9IcczP+HYo1LJtEAQps=;
        b=GyImWcebiw+WiSBUjX2PumwKrSwV6zmbiOuFeGRMTvmKkEc5hlAfyKKQTBDyqziy/e
         bn/kUmswYpHq7TX8ileBSWEG8bexm3dcc0hIAk4LyA6DmOZWNN57jqgWzIW4KIrMUxBX
         6134TU8PMnW57Yrmy39HGJsT41ZE16/DziJuiegCHsC5ku24oFc4pdyPOjic8o1A9mLx
         jcsvRbunOoDWWoInGJGlqX1Q4D7ej6w+dTO0Is/xfAV712N2/blG2ixIwhj1aNq5rjx0
         hK7tCColVedYJDfz4z+YNRQkyyDh+478/83RuNIdMbu4EMXBOPmSYQQdJO85Mq1HrKwb
         fMGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788430964; x=1789035764;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MWzDrNxzthWPdsVZldsnWvMx9IcczP+HYo1LJtEAQps=;
        b=QegjlxnM33lHxv8WErO6xmosjCSZvvtc1GJhK+6Hld1oAl1AeYSFr86Do3UdLtjfiN
         UpG8xoe0EQ3jk7ZOrlbBGUVFdBB4fVSOzS81/0BmXQHb6YmOXx1u5g29sPNodeTIlOP3
         LQ6+Vtv6q7+iFBUdNkzOYhyNS4XxIREi5K/gnjOzhJSh7Aik6pNKjH7i9iOd8vmt4MMq
         Uqih3+oz7dVdWFomPBtxa4cZmYcA5fvdpKwIbdnnU1/zAdrwPAnJZbWdr+IuRxQFFjR5
         12QMz0zkWRcYfi77aTKqk2XA7XMb3JJk7lY7n7WnE543XRZaJlpYf1vYy0tUll3+kMBS
         qmLw==
X-Forwarded-Encrypted: i=1; AKwUvBwbiFtW4HagJNcN8b+uuqZvyRE7/WPTJS1A8o0ngymXO0KC5U6sNtiQLjEC8Pl42KEQ7Np/KnftA0RrEppyMB66@lists.infradead.org
X-Gm-Message-State: AFuF++nhhE62fzyBx6P2+n6OC3Zi32Bmp8lgAYPwclzWY/YnlGYAVvct
	kktv2ApRb+zQ5yQ/lejRO+Ftc0ilIKeWZ3v1fZfzI+SITmUXZZUfmieeD7ni6H2Q/iUAkZQAn0G
	phno59anZuARGFxOZhs0+b2Bz53rvPsL7Cl3lF3tZ6ge9HolY6rDMea01I8JJbm9WG/ldtgksIo
	m0Zg==
X-Gm-Gg: AYBFou3SFJe+OpUvcu7dEXuk+8zexNvvZL8m4YjX9wFh2bPE2U4A47AVjsmWHe90cel
	sppNkrXB7gt4k5zySfvMHfrR/u5Rj6JQxrnC3SR134GbGE8tWh4XmgTZpyri48oV5uWMxTmFY05
	kkuW3TVXBZC6cGIIV7xyep9g6zBhph5uIZRIBup+BVJDAvBto+x+S2Y2w5UmVitAA3C5wK4HIA0
	BTp02hF+dTwQxGOSj0TtkKKXktCCOgOKO0A0m7MRO0v4Ynly4gS0vdtuvjHz8GV1BYbJ7dHNW6e
	olRq08ptD18H4AeO4Mjdhx1ZrINzo6TfVBb+F7thF/EUo/WpYSR+TSfalizi8nBq70oA3C/Uy1j
	v3BWnfq2DzIuuSw==
X-Received: by 2002:a05:620a:6010:b0:939:6132:62cc with SMTP id af79cd13be357-93961326388mr1435826785a.27.1788430963429;
        Thu, 03 Sep 2026 03:22:43 -0700 (PDT)
X-Received: by 2002:a05:620a:6010:b0:939:6132:62cc with SMTP id af79cd13be357-93961326388mr1435820785a.27.1788430962820;
        Thu, 03 Sep 2026 03:22:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee5e589bsm55667075e9.13.2026.09.03.03.22.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 03:22:40 -0700 (PDT)
Date: Thu, 3 Sep 2026 13:22:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 07/15] interconnect: qcom: Add Kuno interconnect
 provider driver
Message-ID: <xkyj7x2chonmrovnwaosd7sci2txi7bsbpvv522uzxdonkke7y@5kpqjal3i6nm>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
 <20260827-kuno-soc-support-v5-7-6d47636a8f09@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260827-kuno-soc-support-v5-7-6d47636a8f09@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfX1KrKnlQ0Hfpw
 aN7661w6Bw8CsMXxM20nj0xojrn8yPpElJy9AhwIp7xIzqfeGuhywd2+X4GJ0cgfqwb9lu8sBJg
 Xdi8pHhMr2HWcA9i6na/gh+Sq9l+/mdic2lGEh0oNz3svfQk8MTSHUs6fQHg2XoiLLA6OlR4wko
 iBrBZKds9PB4e3WzEnEKvkF11Wgqk8Nw+WcDNQuw+uIBaz512nIGzc69JqaCz3QgTW9k8MZhMp9
 pfgxK03KHyLqf7/IJvkxbO0Lws2snXi6FuAHn/noNaMomB6MJrNI/GnZUgVIZHsfAEqkwuu88kA
 8cjvkVrjOiJnZlESUjVeDoAtSNxN7aYDrMdjCrnUujrIK7d56fL7Dtc8hyC/F4i1FMg+lQcZnUq
 QlP6PKOXxFFfpYqghyfJh0RdP9tSFT+jMhtHW0V0cG5EJIKjb5yh3jdyy0uVZW5DwoAzUUTBfQd
 p30meCLfoB81dkD/jHQ==
X-Proofpoint-ORIG-GUID: -nEAebwTkuloC2VtTzjSEUoycdPpz9oG
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4OSBTYWx0ZWRfX2kf1xV11Kw+L
 9amZf8di7MOMN6yIRfcEeMdmZOX1pttfIm3pcZt5FhuQZN3Hths2z2NlyZYVJRhDkG0BCKfJM6C
 ZBhBDLsug1ZK73JE9F9mDsId14TkAS4=
X-Proofpoint-GUID: -nEAebwTkuloC2VtTzjSEUoycdPpz9oG
X-Authority-Analysis: v=2.4 cv=DMO/JSNb c=1 sm=1 tr=0 ts=6a994a74 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=q7XEBjOi5DRkXzmV0jSBjQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=pe0felBmJweB1gBNqhwA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_03,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 adultscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_032245_523093_D0B8AA4C 
X-CRM114-Status: GOOD (  12.40  )
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

On 26-08-27 23:21:10, Hardeep Sharma wrote:
> Add the interconnect provider driver for the Qualcomm Kuno SoC to
> enable bus bandwidth voting on the platform. This includes the
> aggre-noc and cnoc-main NoC instances with their associated BCM
> nodes.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>

Looks OK now, so:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

