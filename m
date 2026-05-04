Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B340FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 04:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T+hqqG9jQe3h+XNHUssoh+1SAkCF/JItpwxK1tygRUQ=; b=c27+R72tBR4urDunHKZbOvYMRD
	TCk6VCILlio4r2w12G2m1N6aCQqL8L561KQKd1R/P3Qnk2PIJvStuB8vDj5JvrdIAfjS1z68ceaAp
	N5ZFzrb3a86Ccg95p/TtS9tgk20JlpgKRCh63YEpZYdPt/5DTM0cq8EnCzXWtkVHAIMLoSxbCDWit
	8cqoVRWE5iFMEyRuYO7XfAoruqQHMCmujEwdUIAv+9h6xDK6wmbTe/gfJsn+SXeI4oauaUtsrxRbO
	wR6kZeaeHgIKgh3kq+gRi524jdyOcV7VQHUGCekfNdppyJ11V4bFoZxUB4e3N6okocqci6tz63vT8
	JZaQd+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJkh9-0000000CJNn-3TDh;
	Mon, 04 May 2026 04:14:11 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJkh7-0000000CJLP-3383
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 04:14:11 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-651bc83e74aso3081170d50.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 May 2026 21:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777868048; x=1778472848; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T+hqqG9jQe3h+XNHUssoh+1SAkCF/JItpwxK1tygRUQ=;
        b=nTVUP9OEYtQWWZop49PUBwaGn7+N7hVILLKqn7JJ2zHt+vQkJjAMW9zN5cMDgQ16Gb
         yUBnSAXJeMjNmsnzt1AHCkcxzsZNSxmoG/4TCji1fxsVA5nIv/2/U9ULG2R6TiS0UzHZ
         0zQzGDJL8yJY0AXb9vqhhUKxBbQ5Iw8JWA7HE5104gZhD9hIBmwC9QmHMU+/i/xcwQFp
         RkY4XFLhYPh/7sHjmOLHKxjtp7POG8/k85fRFKqzJ1jqg6l4R1ZCFUSr6aEyIjkGSnyK
         h1zxmrVWFBsG7I9dCEcZjostZ07ftzWUnRTvb/e2CUcD5OQjYdCmW9J+vI6pndjB2UBs
         Fl7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777868048; x=1778472848;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T+hqqG9jQe3h+XNHUssoh+1SAkCF/JItpwxK1tygRUQ=;
        b=DPJ+ro/R0WPOyf5DmYuQAfp5FsO84tXnRpI8pePKbVCDtyY8Q7Qnb7KILEw1jA7Mfg
         6FvQxtIkuq3y24eqiD7yJj1TMHxUj/fsorA+SE9i52wI9QMek9cYf0ql4e71zP24LUR4
         hfIkq4QJ3jAeOrhLbDWJtXkg096tv4TZniP7aewEqZ57qIvFLiQYvZhjWLrWK1JpEwpz
         9A/3gb0LVBnj06pjoAQPlqfRddjSs82l6ZZ23baD7wciVZJsHhaFIf45tciQm5MQuw4n
         GN5uHyunXpsEwr2f8dbvisbM5KyOHjJQbobJ46HLWMIKcX4nY96qrVfYo1cBbEVnXpJ1
         qOUg==
X-Forwarded-Encrypted: i=1; AFNElJ8cr27RDJ/4iss9xgV/7sP50BincpsSrcpCqvR/9TyfjFii5AARTMJvLUuWkerc4o2ARiHU2pUUhZ3i8FQ/dDvK@lists.infradead.org
X-Gm-Message-State: AOJu0YwJxtvfjj2aG/QhxfKzAs7fdMvzkNiTwOQ7LgxQUGt99kQ+BV/7
	sIncTaFjaruDx/bq+Eiy3ADNCpBJ6CjjbXEW8AJmXPC2hY1USZOywAfF
X-Gm-Gg: AeBDiev3hZ0AwoRTObacG5zVsv+jKbxrExZ+bW3zhkn/JsI5G9QenLQAGejklJlCfeN
	n7tYcTct9tJ6irXwrKAg8SApoAR2h//2LOCvsSwzg31xf/AFhu3pRktPseXOLOy0oMp258bNxkB
	lVnSSMLztRDi0yHydrBs3f5ofiO1cW22IVhC6E8HfnssM/o7JZbLKbj4wCTYtOoQHscYZHux1VH
	NeyPLyk+0BznW42pxQJ8RNnHJBuSnoeBv+3Z/N2DrQ+0vaUcT8R+W09t/H208+c8EfRY41Ju7gZ
	focWxrECOVDQrcws5iKB+N7Rr1dMg/ndxRcUYwV6SjAHUCZsjJE/1BW+qs9nC4kcwios9wOqySa
	Gma7Ij05UkZn3T+vbWSyOTxNfp1AIWAaxGKzMEj0xmy4DAkLzT3MIvKODq+vJrspA6ODnVVxcwS
	6NqSHwNvCY3M73O1yIgmHDr4cVASVP5fg3NMXUCTS2Pj7XZViqHVxHG4psl5zyDRBnh8LymLc6g
	6EyktAFrQ==
X-Received: by 2002:a05:690e:b41:b0:658:9bfb:602d with SMTP id 956f58d0204a3-65c3dae91aemr7518405d50.38.1777868048551;
        Sun, 03 May 2026 21:14:08 -0700 (PDT)
Received: from localhost (104-48-214-220.lightspeed.snantx.sbcglobal.net. [104.48.214.220])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65c2e8b031dsm4907419d50.18.2026.05.03.21.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 21:14:08 -0700 (PDT)
From: Steev Klimaszewski <threeway@gmail.com>
To: krishna.chundru@oss.qualcomm.com
Cc: bhelgaas@google.com,
	bjorn.andersson@oss.qualcomm.com,
	jingoohan1@gmail.com,
	jonathanh@nvidia.com,
	kwilczynski@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	threeway@gmail.com,
	will@kernel.org
Subject: Re: PCI: qcom: Add D3cold support
Date: Sun,  3 May 2026 23:14:06 -0500
Message-ID: <20260504041407.289464-1-threeway@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <dd4dc11e-338a-4d13-9830-095a93187f4c@oss.qualcomm.com>
References: <dd4dc11e-338a-4d13-9830-095a93187f4c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260503_211409_820418_A26CE6F6 
X-CRM114-Status: GOOD (  17.97  )
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

On Sun, May 3, 2026 at 10:37 PM Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com> wrote:
>
> >
> > v4 of this patchset *boots* along with Mani's patchset, however, v5 does not,
> > and unfortunately, the machine does not seem to get to a point where I can even
> > get logs from it.  Do you know what I might be missing?  I have *not* attempted
> > to remove the nvme drive and boot off USB to test it.

> This series, will not have any impact on the boot, this series comes in to the
> picture only in case
> of suspend and resume. can you share your platform details and kernel you are
> booting with.

Oddly, it seems to, because if I simply go back to v4, the system boots.  I'm
using a 7.0 kernel on the Thinkpad X13s (SC8280XP).  The sources are at
https://github.com/steev/linux/tree/lenovo-x13s-linux-7.0.y (with the v5
applied).  PCIE_QCOM is built-in to the kernel.  Not sure what other information
is needed.

>
> - Krishna Chaitanya.
> >
> > -- steev


