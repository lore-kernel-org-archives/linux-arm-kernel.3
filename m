Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA1DD149C7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0O8Uc0wNSl4D87GHeRKCxI8rppppACfX2yHi51S2vCI=; b=UopuB5oF6Kfw68IHbSdw9AbyYv
	J87zpEx/n0dY/JP26jRKUwzS8KrdX7jS9o3bER4NDG65T2dH4lvlzxOUNK0qSP4QjycIwr3IFzqVk
	CZ5PwwdUzM+E32Q3thZ34rYubPYltHSqhOzQopiPhXxJn7d0X1uEJBb/+bY81HDaWQUSyurOTj3zV
	0nDO5E6v/a8T9q0qIlITdmfre+pokpPexTH3z3rAsJmxiZJq0/dWakXQ8DHX8ycmF0kyf1JVFhXye
	P5/QRxWe+U7sMS/cJ2w/k/mYhj3reY+ZZxa9xQuRj63UJRTrJ/dWAc0sl90NHzm+++ObV9ReztB2t
	Sh1ABnmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NQB-00000004TWg-0B9k;
	Fri, 25 Oct 2024 16:44:19 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4NOY-00000004TJg-3PaC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:42:40 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-37d8901cb98so2224102f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 09:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729874556; x=1730479356; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0O8Uc0wNSl4D87GHeRKCxI8rppppACfX2yHi51S2vCI=;
        b=sVtyXU34vfA2fG4A7p2YuqEWBkHbq6bvdoQuWMef1NgzNLDrAhsY9PI/SsMaiQU6KB
         Ln5DXh7B9dykbUcE5FuxyFBOoRi6VOpTUDRqFb297Vk6/AJ2jJJWsLHaaNDyd/OC6b3c
         NLNKPsEao1lb0FNYDGpER7CNGRa72gilRTsPc7MnWqvIHamLKj3PY7CbmMz/Wutm6Oub
         IkjOQ32NAVSPXXwsU5zw09DJWvS9kH9IkiCGMMMidUkq+VaBxXptYEil3bu56aLMoZr+
         aNM5fxwgrN4MCqlZ1s6aG8w7N5FiEEaGX/qmo9ajJv+4eT94KmmfF1KFnM3+LDpL/01C
         tj4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729874556; x=1730479356;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0O8Uc0wNSl4D87GHeRKCxI8rppppACfX2yHi51S2vCI=;
        b=S4DtOXSxPRtANdSoJxNW3SwoN4rQE1GDN3sJArwdYv/Yi/pESJ5QvpwzU9WfmmEFkK
         okCGpxzOCYeWid6rof8PJuHnONr5zGCDkRI2PCvZh6gp/1+Vj8/7TQU/KhMbtN7U2T7h
         iO5EXeOC9Yvm9Lk0SmbaC0Q/CKJ9tthLBfE19TbRccZlz8UoiWrmXrsY3BHfKpoaSJqf
         d9rRtJWljoYSFOm/O9XzpAT6IkGybJJcDmjKLkyRvmpqHOIM8N+q2wlNwnWkiJ191/zm
         KTU4wZl7baKcJvv2uCC7k9m0wPFEpR2I30nzpQ7MI6rRzcw/F2gnVZ5GzcaON1bc3hPg
         5foA==
X-Forwarded-Encrypted: i=1; AJvYcCX6E+Z2Nl3kYqtBFYB7cnm1PG+5syhOAGkLei5b3mKUFUQTXlhdcscanxeLUJ7ThVgkJy4SlJw1btg6ANUBvmNq@lists.infradead.org
X-Gm-Message-State: AOJu0YzcK41xSV+9jiXBPMGnjsDaWQv5rUvUOaf7nSK1wwngSXMuuwUV
	IGbYNW3jHPvqcTs2lIocCGH11f1svYfO1iSqZb6kXyo4NSBSIz3mJgUFnQDSZDo=
X-Google-Smtp-Source: AGHT+IGWWlWECktFU+fFJCf5hYHzpUI+6GWpy6U6Cca42a1A4pI401RfzC4B5K/VBVBk4wLfYXYleg==
X-Received: by 2002:a05:6000:e88:b0:37d:460d:2d07 with SMTP id ffacd0b85a97d-3803ac21c2dmr5083831f8f.10.1729874556540;
        Fri, 25 Oct 2024 09:42:36 -0700 (PDT)
Received: from [192.168.68.111] ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058b1cc0asm1992815f8f.10.2024.10.25.09.42.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:42:36 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
To: shawnguo@kernel.org, s.hauer@pengutronix.de, 
 Shen Lichuan <shenlichuan@vivo.com>
Cc: kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 opensource.kernel@vivo.com
In-Reply-To: <20240920021250.4758-1-shenlichuan@vivo.com>
References: <20240920021250.4758-1-shenlichuan@vivo.com>
Subject: Re: [PATCH v1] nvmem: imx-iim: Convert comma to semicolon
Message-Id: <172987455573.287868.16389296993768691961.b4-ty@linaro.org>
Date: Fri, 25 Oct 2024 17:42:35 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_094238_902181_9579D7FD 
X-CRM114-Status: UNSURE (   6.94  )
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


On Fri, 20 Sep 2024 10:12:50 +0800, Shen Lichuan wrote:
> To ensure code clarity and prevent potential errors, it's advisable
> to employ the ';' as a statement separator, except when ',' are
> intentionally used for specific purposes.
> 
> 

Applied, thanks!

[1/1] nvmem: imx-iim: Convert comma to semicolon
      commit: e2ba37350d1d95c5614defcec32020479fb5148d

Best regards,
-- 
Srinivas Kandagatla <srinivas.kandagatla@linaro.org>


