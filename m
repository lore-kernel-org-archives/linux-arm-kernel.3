Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A62CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 10:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VrUz8PGW2KF5hQpyTzA1xTf3mo1AjxCZZSaanbzdKYI=; b=LwnPatjGeKqomZ
	t43Mpc9lSLSV/TAuSKCTUymIEw03kmgDgK3+/TcYGycWSmPeBG2KwGjAR58nnNc/FaxI9KTf6yWxC
	N3Q3T42rvvnZnpXvAj8AI0TQarZrF9G53CPLzIpwVp5MdflD9vki2KfCU93rEIFZK+C1lWXDUCyAn
	jJBFyO9cWPaBnd+KnyhK4TqfxvcpXZI4VA1gbxX4HPhNmnX8uUuFRgMS2QN0badZ8l1fgnHeiB9yl
	pJtfOJ0YGNJOWuivHWUIVMkwLWHYJ9rzr0bTI2gwLmhtnRF71orInML61BPWX5XHPPBXhQ1j/ZIIC
	MsR0suwsr/8MhkxHL9pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNar-00000005FUS-0z8D;
	Tue, 02 Dec 2025 10:26:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQNao-00000005FU7-29gH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 10:26:47 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B25OlBe1688617
	for <linux-arm-kernel@lists.infradead.org>; Tue, 2 Dec 2025 10:26:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VrUz8PGW2KF5hQpyTzA1xT
	f3mo1AjxCZZSaanbzdKYI=; b=Dd5RfVCognEcboKe8lyMiN/Xwm+gtb21hXd2S3
	CettWgI1R8CpOnDC8q5dSOv0JdvF0hRBOUooCagXTcF1L7iGaOQjw5IHsjAV4qlk
	AIcZfMllxeGUMJSwYPkx35b48gkMB+L+cgqgi3QKJp5AB52+zNBNYOSDtwsbRSoK
	4BHhVVY5pu8/C7qjhnzF6ga1ZDLMrowENFNUucyvUrPqR994t597ALSEnjvq/ImY
	aZe2CHtJ3k/b6g9e5rwjs0K0ashcXUtds8zXvViT5dvQuFLlxmwuvkPiXgpypIHC
	SjYxLdbcKvNr2WapMwwNofu8JKKyFS0IYJHYHZR1fFskPORQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4asgxetnd5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 10:26:44 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7b6b194cf71so7630948b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 02 Dec 2025 02:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1764671203; x=1765276003; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VrUz8PGW2KF5hQpyTzA1xTf3mo1AjxCZZSaanbzdKYI=;
        b=QiDmcTfl57o/SceMuE/pSjyCQPtrlWVqjd79AZAxZ5YR6IIwQ3Aywsl0sn/g2d77D2
         sYbiuN6eswsolLTXADONY1jiX3NZanNB1SaJyfVx14aLKlwBPmVAuM6xUeBecjtQ2I79
         BVeYvCFcZ6W44FCv9Hab9OTQ3Fw2WbOk/dB3CNd+fIblzh4HLhHdzPGdX9845dwsCxze
         tlQ8hQMphazCK8RdreXvLWRRH4oyK/Iit7bBkrYKejOxr+7ImB6xeOgPTvRWq9V0Qqnf
         dwwItEqKGlS5fKfwe08d/5OEqo/yycBwwnqyj1sgJFwSGFeau1liM7y3h6t/n5T2T8/Q
         Di+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764671203; x=1765276003;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VrUz8PGW2KF5hQpyTzA1xTf3mo1AjxCZZSaanbzdKYI=;
        b=gZYwdQgWilH37D1AljXjsWBH6DpIk5vdEoovNNqFUQIJ1y+7lb7U0EmzslRyaB1KJN
         z/TOagXZzQt+hc0NZ9bqeqFOb/r5v5aXD/P8As7hWm/DHevhV0xRKUyDl+lAbvf8xTdK
         da9kyI0F3uzI15+9qy0NHc0YxcGlJfRV4e0oxoa7SbOwPLWMeOYog95MoG7wk12IdG1q
         dZ03CMAis+ucNik15+mslYmrzmYpkOutTxjPUaYEPqND02dGbBiw3uWbbgesCnvtqvC8
         XANF0kJOaOK4KsCwh2HSEoieY1LWDg4aa+yBfOpXnWOdBiW67zVsw5LfbxlSyBCN4+0w
         Mo4g==
X-Forwarded-Encrypted: i=1; AJvYcCXrsflCKjUtyWhpaELXZowREYNOpPjxneusWXqBcqdkeOldizByyPaNFjtHqIASZugoY6k314Z02zL4OgwvgFQG@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+MYtoEiHZoaL1MYW6jzqoqWbE8bmYq35qQptXO/Lg0oIEkWUL
	jaP9YHg+ZfCemtQBQtPm+yzz2+D+9beDlQqXfYPn4wcL9O6lHnHcjQwe5TSrYugWd/0gyvVrkQc
	vg7lfI0+zw5OXUapQSqrdjT99v7+GZAya8MRILGAGjskOqqjdIpGqeMPE0+IGD/bigxTJ9u9Zbl
	PTiQ==
X-Gm-Gg: ASbGncusx8rjnzR4EOhcnh/zV0MvuczxroOY1D4tfdZ74EzgYkRT8ceBQ49AALvgI2Z
	LV9PfX18isqnu/PJpRVOmVBADHwlWtLtRlh3ALfssQ4FLifoz8No+8LY+3l39bU+JzE7g7OWw8w
	V3yYXcCly5iD5Zag7oBVVcu/c9D4T80ac7ekqswwC5LoySNjtJJ1NI23BrKuz/sihCw27B0p9b5
	8zrIrpaR7KeiOAOv+Cfd+76gqiEdk8a4tSMOl8hHbh5MpkgX1OFtmfRlWbZeGMrnPHA82LjpCIH
	hI06uujMZRb4H15FwhBgYc3iyukCk2lWyYfFl5zposuqxO1dFWD18lShk1SVNSV7jV4EaCEJRwX
	UhGZiTja+bG82xGscIP8SvX3T8s5Tfw4NGw==
X-Received: by 2002:a05:6a20:7285:b0:340:6b9c:8a6d with SMTP id adf61e73a8af0-36150e2b4edmr46198303637.3.1764671203423;
        Tue, 02 Dec 2025 02:26:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFqbxAi6x2C16q6RSb0ek1+DoOM9LaefMRtdRnCp29pa73Jqf77f/0+GtRe+Jn5R0eGnnhL3w==
X-Received: by 2002:a05:6a20:7285:b0:340:6b9c:8a6d with SMTP id adf61e73a8af0-36150e2b4edmr46198272637.3.1764671202970;
        Tue, 02 Dec 2025 02:26:42 -0800 (PST)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7d151ad4d6esm16379511b3a.26.2025.12.02.02.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 02:26:42 -0800 (PST)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Subject: [PATCH 0/3] Add the support for SM8750 Camera clock controller
Date: Tue, 02 Dec 2025 15:56:24 +0530
Message-Id: <20251202-sm8750_camcc-v1-0-b3f7ef6723f1@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANC+LmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIKFbnGthbmoQn5yYm5ysa2RqmWRkbJRiYWpmoATUUlCUmpZZATYuOra
 2FgCGaOyxXgAAAA==
X-Change-ID: 20251202-sm8750_camcc-259b232d8560
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Jagadeesh Kona <quic_jkona@quicinc.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-GUID: sXc1l-nHCWHhF-1_CeIytAF694Cje11s
X-Proofpoint-ORIG-GUID: sXc1l-nHCWHhF-1_CeIytAF694Cje11s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjAyMDA4MyBTYWx0ZWRfXw8f3FgGI5a6R
 SYzWC5jSF8wTWGt7MxC6HKY3+TYdFGVp/6vccoQw2vo/vA84dGM6midd8VbC80dqM4Og+e1Kfby
 bzr4ieSLdZlzaiBtF6vskYrJ16e9HczW7V/e1e5pTJVaMjZhDjYSRo836mfdFmNZzNaBXwq/6Y1
 aC9PknYvvgi/YC9QqhULfYFuCqkUjt80+UVK8NE2H3Ps7ZkgMP4GLsyFBiyZf9ntQKagWNCKp/D
 b1IhFGJZr0cWHz5QQQLacLEgpJ6SYTi+HQwQxJltPFoDlsfULgF6HEKpX0+5uEoahminC/66Z6T
 ge+mmYHH0dGIgQnAPavI+FrtCB6TzXGgptaxkO1De93L1dk1nVSl/ghDiiat9sFpbqoGBo/hbaK
 TaDa2Zj+48+GVupkxY0iL0irxjEOMA==
X-Authority-Analysis: v=2.4 cv=A8Zh/qWG c=1 sm=1 tr=0 ts=692ebee4 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=V3dEWrsxhXhpuwuaMIQA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-01_01,2025-11-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512020083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_022646_700125_F1EB8E05 
X-CRM114-Status: GOOD (  13.17  )
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

Support the Camera clock controller for SM8750 Qualcomm SoC.
 - The camera MCLK BIST clock controller, which is required
   for functional MCLKs.
 - The camera CC (clock controller) for managing camera-related
    clocks.
  - Additionally, the Rivian ELU PLL is utilized within the
    SM8750 clock controller, so support for this PLL is also added.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
Taniya Das (3):
      clk: qcom: clk-alpha-pll: Add support for Rivian ELU PLL
      dt-bindings: clock: qcom: Add camera clock controller for SM8750 SoC
      clk: qcom: camcc: Add camera clock controller driver for SM8750 SoC

 .../bindings/clock/qcom,sm8450-camcc.yaml          |    5 +
 drivers/clk/qcom/Kconfig                           |   10 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/cambistmclkcc-sm8750.c            |  454 ++++
 drivers/clk/qcom/camcc-sm8750.c                    | 2710 ++++++++++++++++++++
 drivers/clk/qcom/clk-alpha-pll.c                   |   14 +
 drivers/clk/qcom/clk-alpha-pll.h                   |    2 +
 .../dt-bindings/clock/qcom,sm8750-cambistmclkcc.h  |   30 +
 include/dt-bindings/clock/qcom,sm8750-camcc.h      |  151 ++
 9 files changed, 3377 insertions(+)
---
base-commit: 92fd6e84175befa1775e5c0ab682938eca27c0b2
change-id: 20251202-sm8750_camcc-259b232d8560

Best regards,
-- 
Taniya Das <taniya.das@oss.qualcomm.com>


