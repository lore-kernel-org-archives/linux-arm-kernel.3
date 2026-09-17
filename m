Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1E6FC88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 15:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OziTzy4SV0rdP7QT5/3o4LU2t6LnQ939r26ChBP3tKc=; b=utK7iVJtadvTSGxDhWhNwaZ3Zt
	jwxphaHE3SjlldFBHrqdBF8o2la7l2qNygUkZqQXkbbhfEiFgXd2MfI4fY0ucrvuzzvtVNLa23SpY
	mVmACvu+sLPXGNWWlP4TZuzhUdchm6ODCBDgSLvVVFgOW7ocP69vRB0TjIv7UGQcj9E/PCRipZhYe
	NzfNsXSNBWXOCJ5dDBGH9OmQEyeCpYbRQvoaOhNP5WDSk6mfHhLeAv2b3c5It24F0jkYcIi7BKiDc
	Nm02jRHbjzpmP2i8VRnvFw/JieYUZamAUpdctpDKi4eS2MmRJyl4Vu4DUe4n2Syoh4NnbBkO/tGaA
	wzSbbEng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DsW-0000000Bevj-1Afj;
	Thu, 17 Sep 2026 15:18:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7DsP-0000000Beuo-40on
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 15:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789658296;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OziTzy4SV0rdP7QT5/3o4LU2t6LnQ939r26ChBP3tKc=;
	b=RY09OReiAcYr4Db/Hsyzm0Y2unMJRSNf4hcZVhkmoDSaCwlGZbITj5h02wBi5kNzDwgE9P
	rBGAL10Dt4+Jr8t7tYlXIoULTvmnSlBFoYqGuPaNnx60HcsgMrUNpYMzVrEs2t49KDGdR8
	r7mJiRzcHxnHYzV0DTVXbN68/7wn7V4=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-cjTg3usPNZOiLRKfIaUskQ-1; Thu, 17 Sep 2026 11:18:15 -0400
X-MC-Unique: cjTg3usPNZOiLRKfIaUskQ-1
X-Mimecast-MFC-AGG-ID: cjTg3usPNZOiLRKfIaUskQ_1789658294
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-53094ff7090so26921141cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 17 Sep 2026 08:18:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658294; x=1790263094;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OziTzy4SV0rdP7QT5/3o4LU2t6LnQ939r26ChBP3tKc=;
        b=C7g/jPRv2NQK96v6BhQSnaCs6enhOnK3s0l8fL4PCdJTDZBekqVL207zyQCp61jH3J
         gnMHh8YzjF7CiqaEMQPIvVgO5zkc01uQj8R2wi7uG2DMogI7aD+EXT9t8DaSVQhQBNDD
         dIyFRK+5fgg5zviofTO8aeBCmOzgJ+1DJ0orRZycSkQnIVzcLMiDWkVQaMCAo2Z18FQE
         cPKc5f/mVtsJR9JiZ94uIigoMV4OEl23fGwM4Pv1ThZNMIlIyfJlBePEh4rGs99am2V2
         KOcP3oB5jYvQCfd9csxIjBTId23g1apx6T1zaxCqDFnndLVTAqoInGmy1eJuMJHNGQDz
         jRaQ==
X-Forwarded-Encrypted: i=1; AKwUvBwu2o2+AK93hT7C54UAvT9SuSQO22WAUGX9BhyEcoe6vZkP6EZ8Kr2/+6MXLl3Hlr9qqk97KIHOCROuCS+kYjrA@lists.infradead.org
X-Gm-Message-State: AFuF++kLLhsKbw03rPUEEwvdK6cKy3ln51G2plK6Rzk8HM2yCYvSiC79
	LsE7K192mdjEW2zwH12Ayg00D/AdSsv1C8BcsA+Qq/uIQH9HW4r0sHCTyrSz6nYxdCDQF+HkKyw
	JWqdYBS3iBWct+F80vZEI88kaksooHjIc1NZVMB84AYIrlEj6Lo/+HNZW21BDnKQQVjruX+DYo2
	jw
X-Gm-Gg: AYBFou2G9o+qLYV5Uuj3lVVWJfUy5VklPrqbeyENkhi4oo++tgiA4XLGx5mAAb41BdE
	SqdXxWCPI0XTKWeWZH4Qn0iTfLzc645ogDDo0M5YHwd2evIL5qwowngTHh65P3qhK9OkecEXpPd
	CAykfh8XIkoZjGDhsznrLfG+glu7kk0HIKP+M2nXQqvyi3K0LhJd4HlpBUotfTwjjgcF9XuQ/xl
	Cy1BGQmFIm3CHGoer20+W3Dapt2LXbQ0YF3jxT+Bl/tMQdsM8xgaRyVjt/Z0Z+pYxeCowrQ9ALW
	EWTbWdZALdzVJT1963r2xRXkjB4PAvtm/tf5VGdOVPtnYi6Wkymb+krlcwPm/Ue9Twcv58EUwPt
	dwHYMCcvFdNLSlRf0OwGcL4dE/Onu8ajAo/vmT3I=
X-Received: by 2002:a05:622a:134d:b0:530:98bc:3974 with SMTP id d75a77b69052e-5327f260d6bmr122394271cf.22.1789658294552;
        Thu, 17 Sep 2026 08:18:14 -0700 (PDT)
X-Received: by 2002:a05:622a:134d:b0:530:98bc:3974 with SMTP id d75a77b69052e-5327f260d6bmr122393851cf.22.1789658294117;
        Thu, 17 Sep 2026 08:18:14 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-53261fda5a7sm54054561cf.8.2026.09.17.08.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:18:12 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Ryan Chen <ryan_chen@aspeedtech.com>, 
 Karl Mehltretter <kmehltretter@gmail.com>
Cc: Joel Stanley <joel@jms.id.au>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, linux-clk@vger.kernel.org, 
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260712160301.98941-1-kmehltretter@gmail.com>
References: <20260712160301.98941-1-kmehltretter@gmail.com>
Subject: Re: [PATCH] clk: aspeed: ast2700: select AUXILIARY_BUS
Message-Id: <178965828458.360090.13517236488404002811.b4-ty@b4>
Date: Thu, 17 Sep 2026 11:18:04 -0400
MIME-Version: 1.0
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=292; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=QSpex/un9vsD7Byia08Y7HUcWbITtTxNA+HFXAQOZec=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLLWsGyqkZNmczfufBfb+779J5fQtPJpbRs2ss5YGT/78
 Ot304+t6yhlYRDjYpAVU2RZkmtUEJG6yvbeHU0WmDmsTCBDGLg4BWAilUkM//PiL7I03vIUk2W6
 Fvyzfs+Sm7k/ln06lrqO50joxeuJffsYGU6wTCzReuWhmr77YdxKz1V+F1qlndQsDed9uuVbu8e
 6nhcA
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: vmycmiObyo1hHHxBcm7hS1iVj-thyRHQlZe48Q7FXyU_1789658294
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_081818_077498_0C7B2EFA 
X-CRM114-Status: UNSURE (   5.81  )
X-CRM114-Notice: Please train this message.
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


On Sun, 12 Jul 2026 18:03:01 +0200, Karl Mehltretter wrote:
> clk: aspeed: ast2700: select AUXILIARY_BUS

Applied, thanks!

[1/1] clk: aspeed: ast2700: select AUXILIARY_BUS
      commit: 8932b4283488ea91b1a67fae7a29a505f1d6e965

Best regards,
-- 
Brian Masney <bmasney@redhat.com>


