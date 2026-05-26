Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C9B3CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 08:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z+n/yokY/LnhoQO4/N7Y/2WIUqMJX5BXyYJU28CcaJk=; b=kcvVEBJNSHUtVFQH43EyXAlJfQ
	JRbLXLDd1xNEymjD1u/3ToBbJ57WUWpKK4OQCHJMaHl3ib9y5/rPisCQ8xIhxjGDoWqzr29aWEdNj
	MgD6rweXaifhrMS3p54fZTXqjLLxaQb26UAQRSBFbYIxljgJgNcRChSHTOopRqX84lj0i20QeTDok
	9qy5kqPT4XqlOsoSO8SmE3NPhhrCSAnEOUIRTb2nGlfy/BeWqQz+PAuEQIG8hqqQk0NiOFfUklRs2
	u/QTCirT1zL41SE9tfUGgnord4ZZgL+1VQSGrKtAGRnHUqwQBdY20oiseCjkwrovMVnwaWhMJRkux
	fXkVKo5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnFA-00000001Npx-1igD;
	Tue, 26 May 2026 08:34:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnF7-00000001NpU-3taL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 08:34:31 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64Q6sCNv3582711
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:34:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z+n/yokY/LnhoQO4/N7Y/2WIUqMJX5BXyYJU28CcaJk=; b=p1c9J6vvPxzObYFA
	HzcSo4qtpIGKTdvlz72yTPVRrFKR2Xp0eUXbo3bgHCOD/l6RjaWNxC/bemr/dt2Z
	nmAA5nGuQwIlBrNhPDMni2MyXKXgCv1LHBXSfCBAJ+yw9OuzV4nyXlrzq+/3b6qY
	AGPTl0v3TBJfppcH5bali1yaeGMHDpf+nb5qPFv9Yg48luv+cYjxrMkFd/jn7/xM
	S2XqZp/vkIz25mzglzRL0V4fUYMLT5uzxhIdLdk2Tv8hyRMt7a3Z/U46Rv+bjpoU
	DLa9PrwcRniqmVpzWe7diHKSAiC6CS93lQYKP92CnZEDf1AKSLQISiTKGDLSx0ye
	DCcjrw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eckyqku4v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 08:34:28 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516ccfa109dso84995611cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 01:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779784468; x=1780389268; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z+n/yokY/LnhoQO4/N7Y/2WIUqMJX5BXyYJU28CcaJk=;
        b=QA9x8Y4BdrZr6kBe3Bx9ZOuSd/AoiAqJVACtkue5Pu5vWnt1SOZQVkhQDuvbY3Ydh4
         MmcNEPL0Hy775ZRxmPQUitZADGtgbI4Yva0qypzsysOCVrY8Pji1nX6cApvA7MJq7mD1
         KiUrm9xJlkDCu7TeOLtHqet2mK/aqqITBZ5Hfp9F9yxTaO1N/NhnRwAjDbh0wF3NOe3P
         koO2ebD/A34mTAYbMLG3zTOKDdTNKKZj+pOJyaMk7ZqFAxZiMdzJHCQSyVoKhjgT9oDy
         IKhRiJ0tpY8EB2lles3qDkoYGFrZsr5iS7+PYVxpVjxSvOwYngZqJL+7jIKeX6FGjAPF
         efQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779784468; x=1780389268;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z+n/yokY/LnhoQO4/N7Y/2WIUqMJX5BXyYJU28CcaJk=;
        b=MCXJvEStVT7OFRRBqoaEvOsRaoRn0aI7hALeXYSgE989GRgDY3HBWAu/GIKyd5Q3JC
         cGJ/CQvG5ej/1VkvPqcIt3SD55UsH3lp0KyEWp/yJ6wosvrr96KOm9EoxqagudzLSWcK
         AjcpXk7MdhnZQOZlUEwfw4dfsgi2AZW8M3kNcFG5akMvTWVohTd0qHRBy/Ji+lufiroY
         CFDuqW1GY4EDYQWep7Q9ZCVjP+7UaVj/9a1lWxwZhc4Z0AdJayWC5eyp5AXir0SeZb3U
         F9u2fHfeVRj4HgSeHocIdzAn0ncd8GxCJUtpoD6iEP+wInTSUCy/YhXFaiLsJU0T7602
         ZZ+Q==
X-Forwarded-Encrypted: i=1; AFNElJ/X/Laei5arDYUFi4kmUCaT3OiymueAalfzz+PQNhD7/HowrEzdROj6+j+5x1JzlMztZFGY5fN7IhMD1DfFQbic@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7rBI5/PI8YiyKbvkHZNIP409JGaQY9LD8PWUqDgXPpr9SMdMj
	JCBqxP4q0XQk8xZmSwC9Y10i+/nd3RO3vjHR0qLylTGTPo9SOKDsfaUlLarqGXCp3/DpdayMf+e
	P2w5fCPKwQA91rne4FO/s88VhBQuOIX+KmT+7dY36af5wPifVnrgF3Knn4pObRG5QzOzZnEYyL7
	N5xA==
X-Gm-Gg: Acq92OENQmxIQodKHjIzHUECzdqr5C27T+1TmOZMf6xfTMtv6VLpPKXEg5GMW+LBjbH
	HfhXTfRNpJEMh3wuZL85+tnw6RWK11V4uqErEYtha71M9Mg8OhBSZNQYtY+xe65jKecqS2xS0dw
	1Ds4Mrm2HnDVyA7Qyjcmqgno6p06p5/XDoRFjdtpr4tyzu5JyyZOf4SWPDmMCX1O1fyNJAHkQnh
	+psmZsY+HniWdvTRc7ZVTW3Eh+zCvL+9Ip1DmMgycklFYhSVbbzYiNhfoWMxNwRGOpQOa046WOD
	qR5Hz1amtBQcFCCZSSrRQ2HHWayMhqgXo19RZId3/9ivYmQCRp6o6991gN5eHPzQFJTX+4/1oXR
	OiHmJoDPo/AaMvGA2Fy31hZXaQvEJGgcLpj/kvHBozzPAmWwRolN9n4fk/SeL
X-Received: by 2002:ac8:7c4c:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-516d467ee64mr235196821cf.44.1779784467942;
        Tue, 26 May 2026 01:34:27 -0700 (PDT)
X-Received: by 2002:ac8:7c4c:0:b0:50e:631c:c390 with SMTP id d75a77b69052e-516d467ee64mr235196641cf.44.1779784467486;
        Tue, 26 May 2026 01:34:27 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:77fb:9b68:d26a:48e6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49048c6acf8sm92904325e9.10.2026.05.26.01.34.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 01:34:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        linux-gpio@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] gpio: mxc: fix irq_high handling
Date: Tue, 26 May 2026 10:34:18 +0200
Message-ID: <177978444191.19212.9827196149190633847.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260526063504.25916-1-alexander.stein@ew.tq-group.com>
References: <20260526063504.25916-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=RMyD2Yi+ c=1 sm=1 tr=0 ts=6a155b14 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=LetV_JAka1SG655h8UQA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: AWFYh2YtComSHByYXHln_lamq_voa8ut
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDA3MyBTYWx0ZWRfX2H5PaR//4ROh
 yhMmI1ODTPZq/v5IuuKgp6lcmm3a8gCRT0O8XcFsj151fj51uXx+2DarwpR0NCZs7Ese/V/t2OO
 LpCksLda9NT22s0S2BSuoqaQS8o5BCojKnLwWb75VPRT+RgXOFkKIn3ttvXkMER6bnLa0RPKKZ3
 sGHAYVKPuOjJ6S0Ba7G08hFRj70tJZM0Qev3IiRwNtpJfkYQ9MmojOSA3P9qXOwCt4NpY1QiGRm
 8DHq64VxrFD3/FDw3OgGTZVlHaf28NmOeJaHsfZotJGhDZG7Nm6QmgKL+HOxVwgyR252m1YkbLq
 bRENR/zd9EIg9o+7+znjWwj5sur6Q4ohzsW9nN9sKtP8pSJJfUoBBkWJF9vulQGyHwefXLqb3iN
 zdgVko08esYh3IJDKiBvX5ynRF6KNFkCLDz3UgM2pvmq5MODLOutmy5+NVjVzm/kGQ4AHVIX0Y/
 V+Ih6V4pHkzf50zGiXg==
X-Proofpoint-GUID: AWFYh2YtComSHByYXHln_lamq_voa8ut
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-26_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 adultscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_013430_113355_0700DED8 
X-CRM114-Status: GOOD (  11.66  )
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


On Tue, 26 May 2026 08:35:01 +0200, Alexander Stein wrote:
> If port->irq_high is -1 (fsl,imx21-gpio compatible) and gpio_idx is >= 16
> enable_irq_wake() is called with -1 which is wrong.
> 
> 

Applied, thanks!

[1/2] gpio: mxc: fix irq_high handling
      https://git.kernel.org/brgl/c/dac917ed5aead741004db8d0d5151dd577802df8
[2/2] gpio: mxc: use BIT() macro
      https://git.kernel.org/brgl/c/077c421b38ab87f32f7ef4503a6add43ae4cb57a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

