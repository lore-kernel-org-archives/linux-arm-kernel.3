Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D1F9CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 06:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BNm0P/bZjFz50FHQ/dGvilOppAsbdM8goRfGTDaWVD0=; b=OKMNiSrgpNN/IxYKgtCRgNk8U4
	sIldVCREe2WvhB0neDHGQc75XbgwJ6XVjeTljoEEC7JeHhr1i8qmIl0u6+EixvnIhum0W6sSS8/7O
	rxDpwjGVGjysE+x5VLtTD36oxmmVB8mTBvs35UA1NxTQVF+wf0TbGCA3ikim30AdNL7XklThnruVO
	XEUXkl+k63KbmFrDOiMnJv+Y6qrrfYarLqBGjvt+WAnOExz1N5w0R1ebGTMIy8oED3RyOxQqD67e3
	PX2vYeEtOiRed2Uf929xasc8CuBy9O/X23tacRbFA3WDUvEoH1oZEK+jyqytjJ00mfOUkHN/YE01o
	62xSihEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrw9-0000000EV0X-1ylR;
	Mon, 18 May 2026 06:58:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrw7-0000000EV01-3wfE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 06:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=BNm0P/bZjFz50FHQ/dGvilOppAsbdM8goRfGTDaWVD0=; b=OuY5kMyDQwlksOErMTMKwknvYy
	78gJfXbzKyl9XO/9QRC8QRSEnUlhLy/mHoOry/0B6YSo2vdHcaxp4r79JHaj+wa+Z6vn+A0m8jU7r
	EF5ZXZzRFZS7J6Y76Z4u/DBaFBngQPMPVvPZddwg93IaJ8aa2/9qWDuII3pZkflAAKySzpwLok6jS
	DyB2+4SCBWW6yH8+6u1IqiH9gybN6zLCh/os0snHHt0AeCsTyEqR1deFboU6oMJi6Hdb5qb82+euQ
	wMEw+wOUr50OyAuLUaV0uX+SW4phNXr8LNIbt5SGgCGeOLi7424REEK2ve1N3zVc8qDgVTus2samU
	DTVFUI8Q==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOrvs-0000000A5ur-0pwm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 06:58:45 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64I5eHiD833037
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 06:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=BNm0P/bZjFz50FHQ/dGvilOp
	pAsbdM8goRfGTDaWVD0=; b=g7nlHgDuv4DoaJItVPkAN7izhmqHDWExDMqkusZ6
	+oqh5uRTL7mDem2MD6z7a+lpUc7KnCWU1x7EbVF3XUQZo0e5aZgNpSRF5n2peHub
	YGj21uooHZSFUA68f9qCAJNq0zxM02N00XDO0c4b9Cd1GAvWjctESjGUDyKyrT8B
	MtF9h1/E4icY74Oxv3sVTHy0iEXlAYZxbdOWZGWWsORuxuPr63tZM2EgJh0IcmWW
	D3KkxmGOx3/Ux8ucDkuquwrYPzVLbAa4U47QljHwZYSybQ+a5bim3W4XmUrSh86o
	p/VdVUhz/U58aThViaa8RY8wLN4x/I/Who8JTW/eLgAkKw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6hbcd17r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 06:58:28 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-515224a8aa0so14697791cf.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 17 May 2026 23:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779087507; x=1779692307; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BNm0P/bZjFz50FHQ/dGvilOppAsbdM8goRfGTDaWVD0=;
        b=h33MGET89wktqHPjj7OpMJ8Q0w6jBH9x5H7rAM8S3zuFZhqAjI9y14MGW02EChrVS7
         TAiReDQhrfJmFEI0zmDlzPgCdGhyEXAHyDk4llG2mJDSmiZ57cRIpkiRg6PsGpdpfNE0
         VZhADVhU7Db5jWfl9CT/N7hKesAmcGqkHqZ3zbSmnrIjj0ObFLDO0ZXB4kLQvjszB35V
         500TSJsjNOHlHs4G0t04jRKlABEElrsiFWYs3mUl+i8bQStVzhvKUPLw3hT2DWMrsMq5
         Oj+fDjxvle5cnU9CRIZFmWBQfMTPAID0jlWRUxGuvnZu5/wyvuBVfYYosGhMV5jVd6VD
         r8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779087507; x=1779692307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BNm0P/bZjFz50FHQ/dGvilOppAsbdM8goRfGTDaWVD0=;
        b=q9k8MyaPKKasy7B1/iqDVRxMI0geCjXgzTsPGfQVkIKkl7QKSOfsrKsVip91MEkZRG
         y0HdCgwIVxCpTf0yBE3C5ZDzTpvoCpABWjKlXfZjPN+mJf+dx0gisx/aGZ3l646LLgf9
         q8AGqYrYwT6dTCzxQGcB4kQSUkfQtqaNfTS9FF/fbDWzK68/aMsLvkkTmF6J88SOMNSf
         yLqPA6VcbNfhz8+QoInrB8MbHx9/aGkGo230GorM2bAIdGyDO2NILpHH0kvVDjAVQwRY
         +++4dWxsUoXa5P6sPHvMIi2q4zTbRKnkrUD3zadea+QWA4d+AShEqUJPl5Ekyma/a4CC
         X3nA==
X-Forwarded-Encrypted: i=1; AFNElJ9NmVedQyXR+jhscQs4V8ccjR2paqFddabYcZXA5FA650zpE0moMfLOSwFXTZtDvh2FEjKX1nPDfnI73qLEnsoY@lists.infradead.org
X-Gm-Message-State: AOJu0YxVnRRYhXkBJNl2O0WIZsaoXBTXGU2Gdz0tnA4ZlarKn2g/h4A4
	XM2V6TBQo94O78N+YtwOr2V2rEp4vX8TRuA4eYFktv18kFvjPUe+ZCI4JQ+aJpcOm6pCzXCn6Fr
	LnTJFnfzyk4Kr6qCDZQb08LnMk+LBBB67iWIipYozBJBT0SVOfyjmDOn9OCDbjuNZsbK2+QbDYB
	8vlA==
X-Gm-Gg: Acq92OGpvscP7ArcIKJVUfthJ85uTxIpbxujDWIC+PQlx8hinW6dciN1swIczRDjfKL
	R04IRDkF2IJgEnncz7YW4tCwTJ+eMwz5r2BaqIbO0rOnA/dlxgEjJrWTYw7P2R5ol5q2TfYr36q
	uZ2u9ET5Ewc05Z+5gpFLTc3UJW57z9xn08jZF5t2eQ21PtHQjqZNX3R8sysFN2j+Fnfk3Ja9eis
	I1J/w6lucpCqb2XZ9fkyBw+hPg/yrWXTGKj5ziCAD5OqNKy9wK7JsK2343qywEeWKR4OPHx8QiN
	nrYqDNkrQv/U0qrmNkQbSVZaosp9MMC+uF49YjWTIcaqITo03rjNAt3u8Yki64NtbJgV8nCgtmF
	bfGPyautBVuoUJbr+E/tvdWPc96hZmwMpATM=
X-Received: by 2002:ac8:7f8a:0:b0:50f:b732:202a with SMTP id d75a77b69052e-5165a04b49cmr191471141cf.27.1779087507092;
        Sun, 17 May 2026 23:58:27 -0700 (PDT)
X-Received: by 2002:ac8:7f8a:0:b0:50f:b732:202a with SMTP id d75a77b69052e-5165a04b49cmr191470791cf.27.1779087506469;
        Sun, 17 May 2026 23:58:26 -0700 (PDT)
Received: from oss.qualcomm.com ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm35167840f8f.34.2026.05.17.23.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 23:58:25 -0700 (PDT)
Date: Mon, 18 May 2026 09:58:23 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Paul Geurts <paul.geurts@prodrive-technologies.com>
Cc: "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "peng.fan@nxp.com" <peng.fan@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "Frank.Li@nxp.com" <Frank.Li@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "imx@lists.linux.dev" <imx@lists.linux.dev>,
        "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Martijn de Gouw <martijn.de.gouw@prodrive-technologies.com>
Subject: Re: [PATCH] clk: clk-imx8mm: Initialize clocks in arch_initcall
Message-ID: <cr4z2qzawe3hlhcr4lvdf5zmlnt4cfbec7p7jhyiwgk7dkkwlp@3gu36sd3afoi>
References: <20260408101313.2082125-1-paul.geurts@prodrive-technologies.com>
 <l5fcjw4okcpk3nl243xqn7y57nr2mjjspjdfl6m3pi6smx4phb@2qp722n22lyq>
 <GVXPR02MB109688D7C86DC2A63D8BA146FBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GVXPR02MB109688D7C86DC2A63D8BA146FBD2C2@GVXPR02MB10968.eurprd02.prod.outlook.com>
X-Authority-Analysis: v=2.4 cv=cuSrVV4i c=1 sm=1 tr=0 ts=6a0ab894 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=926zIK9uAAAA:8 a=GegrNMS54E6FrsLxTi4A:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=LlT7wNnaD8DP1V76ktP_:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDA2NSBTYWx0ZWRfXyAz9sa9cWzbS
 /ZfpNTNjwtGun2frz1OPzZvf+LV9oG/t05yVvcKRCVMWlUahL1o/It+gZ0Gmdn7QaMminYadMPb
 UUhruRu2t3ha/sxRkfPBRTcZ68p8LQmyduKrvjYla1P4IPVx0mqGj4d75A7RBxF/CvzvJOi5na/
 I7bwAPLgTyRAEAodZUZE6jXvTK/pvEG3A9+pqXF1iY5I/slM4t+RyDdySJwmk3zO5rkYF8CvIEh
 DnCtrQhsW2vovx24u/xphIIKIzMOTj1VSXKt8v1CGEPywV98Y79EBumtbxA5ZY+5mi3397taluH
 QX33yl/GDoKnZoi4xIdTC1gftrb87IbOBgGt6ZDHVobb08smPPvAJSo68FlsEZDjcJVt8WJOSQA
 OZmCppcPAtg8DSbCep14wJL/K238aA+li9pZxXAWG0pK4DSAwIZbBkrN9QLUHtk+1omJQq8wEg+
 uDVfgu5DDnCIdNsTrFA==
X-Proofpoint-GUID: 5Egu20TmZ3L2XBsjFvf4ThcLYYZPEG_s
X-Proofpoint-ORIG-GUID: 5Egu20TmZ3L2XBsjFvf4ThcLYYZPEG_s
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_01,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605180065
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_075840_721061_FEDDB16D 
X-CRM114-Status: GOOD (  31.76  )
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

On 26-04-21 11:14:27, Paul Geurts wrote:
> > On 26-04-08 12:13:13, Paul Geurts wrote:
> >> The i.MX8MM clock driver is implemented as module_platform_driver();,
> >> which makes it initialize in device_initcall(). This means that all
> >> drivers referencing the clock driver nodes in the device tree are
> >> deferred by fw_devlink, which are most of the i.MX8M platform drivers.
> >>
> >> Explicitly initialize the clock driver in arch_initcall(), to make sure
> >> the clock driver is ready when the rest of the drivers are probed.
> >>
> >> Fixes: af7e7ee0e428 ("clk: imx8mm: Switch to platform driver")
> >> Signed-off-by: Paul Geurts <paul.geurts@prodrive-technologies.com>
> > 
> > Nack.
> > 
> > Nothing wrong with probe deferring. It is there to ensure the order
> > the drivers probe in is correct.
> > 
> > Plus, moving it to arch_initcall won't solve anything.
> I disagree, as it solves a _lot_ on my setup. But I think the next section
> explains it better.

Nope. If your setup has issues with the clock controller not probing
early enough, then your setup isn't following the upstream model.

Please describe exactly what are the issues with your setup. Maybe we
can find a proper solution.

> 
> > 
> > fw_devlink will not stop the driver from probing if there is no provider
> > that this driver is waiting for. And if there is a provider that is
> > needed by this clock controller, moving it to arch_initcall won't
> > magically skip waiting for the provider anyway.
> I think you have the issue backwards. There is no provider that is needed
> by the clock controller. The clock controller is needed by everything else.
> So the clock controller is not deferred. All other things are deferred because
> of the clock controller.
> 
> I understand that probe deferring is not there for nothing. But I would also
> argue that the initcall levels are also not there for nothing. IMO a chip
> clock controller is an architecture driver, and belongs in arch_. Whether this
> is the correct way to do it, or whether this driver should be able to be
> compiled as a module is a separate discussion.

By the looks of it, you are obviously confusing terms here. A clock
controller is never an "architecture driver" and it definitely doesn't
"belong in arch_". A clock controller is most of the time a platform
driver. There is a big difference.

