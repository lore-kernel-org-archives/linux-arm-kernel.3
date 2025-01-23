Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDBA6C0218B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 15:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NrD9tohMn9+0XqNxtx5bn8n/sseawkF6bGYnJGkw4Qs=; b=b/9MX8foi0cc5ambgUkzhfkPyo
	6BbjE5jxsgzrCxmQTXevr6KGCFnmzkf6cxTi8La8rSRBdFKGGM3gaMjbIWabKxa5ddTeeXRfydEHy
	sRLYKJKlSy2QyTGNvUfh6s+1hNGdOUckNy/VWgaGxL5+ppH8svo0E9uKfJ6lbXBUPILBrw1SgAYUP
	4cFOtzr054uWqCKNg/OkNazJ73hOFM/dlxdq1oaCmJTPs8s4JELH3qv+wjpB0uEWgnpfW2i06Lp7F
	mJNiUgKGBSFisBWnS2e15gR1uvLFErCrgJD0qmGKhDCxWp7VLnFx2dJLstcH3CyXtk0OJziJ77TZ0
	xVRT/Cfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tazBd-0000000CiRp-33UO;
	Thu, 23 Jan 2025 15:32:05 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taz9F-0000000Ci5q-1AuY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 15:29:38 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-e4a6b978283so3653008276.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 07:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737646176; x=1738250976; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NrD9tohMn9+0XqNxtx5bn8n/sseawkF6bGYnJGkw4Qs=;
        b=QvQxJ+f15JB7xldUzbyBuFsklEZvRuhyoDk4E5x//R/rZ1l56DG15S3vYX2S4MQf+i
         FeGTRUIAaa8p6v17lniJfr1aVEer5QjkiTB//K9P8NxhyRFZxl0nvtJOnltb+jUxkPsR
         QjdyYGlVUr6CtzJiWCq1NLP7vsa8wdeFx2FGpiqbhj3SUrDLS4vWf1Ifv2UY5Sdtjh8n
         9p2z4xUv1LhQ/HKcqOHHHDLcjQrrqnr/rTZ0q7hrICSAxTmmUHMaNCdaodvaDl69IBSw
         EqSVWDQJJj0cBJT/MF0WGElSxwiaJlu6/q/nNmGPk4jvP1IYk5axy7ZD+cIV1gxLllc7
         Frzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737646176; x=1738250976;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NrD9tohMn9+0XqNxtx5bn8n/sseawkF6bGYnJGkw4Qs=;
        b=geO4By/8YsWamg8xB18WTgef5Dh5J4fYS/fsMvRLSsDZ+PSpcINNYvKRrrSpsRM3bP
         qV6dkdmlJ68nJIENpLH75Z/uNRxjzXvsG35waY2LcuMiM+1YgUCowmnNXhN07zJOq+NE
         XgH/bCSoxLu00xk0PpcUKUWWNkkaHUbazHOodXHVOvE83v5PscGcgD1ouU4D+SMqBXtv
         MzzthDdowH60uvj0AYAXssZSLv7b1ZOHjOXa0OgI4gWBdYDNb4ajvaeYJ2l+/UXqZibs
         zv5YRhMN+hFqN9wO5U3uTNT9gAFOZc7mzCqNRZQdZxYN0MRLmKQOenTeppvqoopURfVL
         H8Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUBWo1JgZI2pRntzD6kEF+/4WOxcDnzzQzPOTJKixI1jqkSHXsvYsvSPjRn63cJRh+HlSj0BLRII+Yu0weppbdQ@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4PadQK1/bixZ1Y6MemCDwDlVuYVLitq56LmeT6FSMlspAqqAe
	wKEkTGVUeIXfgaB3MpQBbkPmYzVjGA7UJirZ74MuDVj+2tyhqZjwtHRtGyszPNmb3N5FgWPJWUp
	WUC/15dkXE9bIO3H+n5mw/hR7M7E=
X-Gm-Gg: ASbGncsoXBLILrlDsiHDrH/k5N36QoKROinTiEf4VWURCUBFpyT1VFqLoIip2HWnDnE
	ji3VG0wKGJyoHQr7F0lex4GqqVMqM+GWi2a3WxCKKGrGApyaSJ+WwpDW1KaAqHd4=
X-Google-Smtp-Source: AGHT+IEcgaNEMT/nz9felDBiOOxXNv6kz7jxv8iPIixkQPXeXQj/Qcp8sEMC4T0kInZ7xTeKCClB4Fx7CAupT9sEVhs=
X-Received: by 2002:a05:6902:2a8d:b0:e38:9227:befa with SMTP id
 3f1490d57ef6-e5825780b02mr3125345276.1.1737646176006; Thu, 23 Jan 2025
 07:29:36 -0800 (PST)
MIME-Version: 1.0
References: <20250118-z2-v5-0-6d38b2582169@gmail.com> <20250118-z2-v5-2-6d38b2582169@gmail.com>
 <Z5CNx9natNYmJ5il@google.com>
In-Reply-To: <Z5CNx9natNYmJ5il@google.com>
From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Date: Thu, 23 Jan 2025 16:29:25 +0100
X-Gm-Features: AbW1kvYrTQzvZ3DNs13coOwZ-EGWuTfhUMiTchLAOX9rz6NmJ2BSwg_pqYaH0XY
Message-ID: <CAMT+MTQudKdUs5we_UCqN0WPJn+T0pyY+NrbaBFKBM2Rkuacmg@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] input: apple_z2: Add a driver for Apple Z2 touchscreens
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_072937_316838_8C683DFA 
X-CRM114-Status: UNSURE (   7.46  )
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

On Wed, 22 Jan 2025 at 07:18, Dmitry Torokhov <dmitry.torokhov@gmail.com> wrote:
> diff --git a/drivers/input/touchscreen/apple_z2.c b/drivers/input/touchscreen/apple_z2.c
> index 4a5ea252961a..a1bd2f3147ab 100644

Since i will be incorporating this into my patch, do you want a co-developed-by?

