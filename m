Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1852BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 15:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dewwjEHiC/f1j2kZT3ud3l+ya40w4quf5jCt4g64WtA=; b=u2raLz1qk4hM9N
	oPbUUsoQhJ+rXtptBuhM9YnPOzvclZklW6lh9vvdGNKHQZnceCxC41ToccAGndylBaRdBKoctl/R8
	LaSGMX7imYPPju7k+7eKa+6woHGzWtN6430SGXQ+2VvMdqyz7ujy0GqTV8cgnUATLjDWJF3bFL1bP
	zs44jNlqqgIt6z9rmVFWlCqjC00U9ts/C2+ZhMekH6ccdBq1i4UbVBGlEUCeuXNXMdOCcIEqqfMee
	TPMaJaLYB4EmKx8tOexhTDPX+ELL4V7WNUQnd+3yniXs7GVbp/LIU2t1vxtd0fPBTniAkJSoyyeNe
	10cHn/6D5IXRFXRZJPSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqdB-00000002uYa-2fTH;
	Thu, 09 Jul 2026 15:25:41 +0000
Received: from mail-wm2-x0b.google.com ([2a00:1450:4864:31::b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whqd8-00000002uXu-28Nt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jul 2026 15:25:39 +0000
Received: by mail-wm2-x0b.google.com with SMTP id 5b1f17b1804b1-493f17dc838so351315e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jul 2026 08:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1783610736; x=1784215536; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=dewwjEHiC/f1j2kZT3ud3l+ya40w4quf5jCt4g64WtA=;
        b=dqawGL0UGykYhN+nv6e12dkuq+nOw+v7xqI1iuUNk2LQmVnrXNKS07YXuv48xKEhzi
         icLW6sT+UV1nwsYF9hLmaMeeUavGiM63BTGAGtjig3fOIAukGH57y54O/ojCYht6KJaX
         /iBMTwXbCmTzrwcnxzjlU9wUlsZRB5HE/793OtzwGa3x0KAA0lp3Pp7lLYvJRVDPaCAA
         uSlZd4gpv+af2qZhlq14i7+KTMAWlbEg8ui3ZHbxF5+ZYAs1g01nqUMOw8ArYp0aPJOg
         ea2YpuNcFrUWLnBKyNDYhL8FnySyGl30iVqzotKs1PX3BxOuOOf1ZIdlOmipm4YSf0k3
         BkZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783610736; x=1784215536;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dewwjEHiC/f1j2kZT3ud3l+ya40w4quf5jCt4g64WtA=;
        b=R9UpXAjRkFIrlEUoyYWhTEHDUKaZdm0tTLDO4ZEMdYnMFRLBrs9src+VT7OLiXrP6P
         rI20peZHjIBFpa/ilTXQCwzf77k6UXl1hk4icsKBzzB/AbMiO+a+1/XH7byQ7zlNLuMw
         nVSPaceaM2T6TBJtqlOSNkSblmI7Rqun7/jmlPHdL5UnXprwkRW++EatsHIDc0ip3rqy
         zzfj/JCDsy14y3bcqELJLwcV3JWzZ1unj0gOgBPL0PN/ZDe7/H5kKVw3MoiKuj0xghJg
         s/+k1Jab4JMbYW/lmkydf9lO9NgWFSlDOn0qAPbnlLBSXaTJ6924n7O+D0Uim+93+43i
         lYWg==
X-Forwarded-Encrypted: i=1; AHgh+RoaQwRmjknHZugzSupaetQJILoRQNWCC0HHaGnnNngy3r4li4POYmnx+a8DaNV/yaehMm8t7c1ZR6bB13z86YrU@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1CwIaIjy3nOo4Eaga+mIW4DovbUNWW8jNnTRSGAy2VVBwGyrd
	YLRW1LxDThP/8Hav/UJnrjA11NtWwHX7gBfsnCyQFiQb4YHWsvbh088UnRLDqya34o4=
X-Gm-Gg: AfdE7cntpP6rwcG5SZ3AxXhAidcyqlx599VWJBtWNvCL7NNXuFaEZnFc+ZkQeTcM/Me
	0l5zO4m76NlIHkhDR2krnVSvrgqNodzA6/fSy95QrDqM8/E3sZFQe+ejQb1z/c6nkbMUgkvM91S
	um5cPtp2E0MFRN3mKD8KHfj8/wspmScfPE9HGFMd+6DIuTkdDhHfIm79O4K6OsOWvZ3xyGHw9l3
	GLzhkPqLGuf5z0IqZAurKgVAkCXLe9YkUX7rQFpM/eYEdWEbXeQJvxYAYeOaiDj8JMTtalY6xZ1
	yIqs52J5S0A/dJiGUaBbOpR4w8/24qXF6reXkLSfg8MBkdKNFUSy13Oq//gdI//n+u7r81kO3nu
	pAPU+7uPHJYBdndt1dT1pX5e1BPmvjHcC19cyap5jirAYUbkgt3gNgZY2mkXg+ILuPBbAqMAxd7
	NGuW7lGuoKKpy1xh7es1d0Zg==
X-Received: by 2002:a05:600c:4e0e:b0:490:e60b:6860 with SMTP id 5b1f17b1804b1-493e6892ea6mr70392285e9.7.1783610736370;
        Thu, 09 Jul 2026 08:25:36 -0700 (PDT)
Received: from ho-tower-lan.lan ([37.18.141.193])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb73b161sm61866165e9.9.2026.07.09.08.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 08:25:35 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Subject: [PATCH v2 0/4] coresight: Prevent per-thread events from sharing a
 sink
Date: Thu, 09 Jul 2026 16:25:20 +0100
Message-Id: <20260709-james-cs-multiple-per-threads-v2-0-10ac7ac6af0b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGC9T2oC/4XNwQ6CMAzG8VchO1szBjL05HsYDgurUANsaZFoC
 O/uJPHspcm/h9+3KkEmFHXJVsW4kFCYUphDptreTR0C+dTKaFNpq2t4uBEFWoHxOcwUB4SIDHP
 P6LwA+tybU7q2KFUyIuOdXrt/a1L3JHPg9z635N/vTz7/kZccNPiiLrHypbWuvQ40OQ7HwJ1qt
 m37APfNAYXLAAAA
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Qi Liu <liuqi115@huawei.com>, Junhao He <hejunhao3@huawei.com>, 
 Jonathan Cameron <jic23@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_082538_590858_E6EDD759 
X-CRM114-Status: GOOD (  11.20  )
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

Concurrent per-thread events results in a WARN on N1SDP which leads to
the realization that per-thread events shouldn't have been sharing sinks
in the first place.

This slips through because different events will have the same PID if
owned by the same process, and we only check the PID and nothing else.
That results in unexpected WARNs because it looks like we assumed it
couldn't happen (although exclusive PMU rules allow it). But even if it
was supported it would result in trace from the wrong thread in another
event's per-thread buffer, so we should disallow it.

Fix it everywhere the same PID checking logic was copy pasted. Then the
PIDs can be dropped from a few structs as they are now unused.

Signed-off-by: James Clark <james.clark@linaro.org>
---
Changes in v2:
- Fix inherited events by following event->parent
- Link to v1: https://lore.kernel.org/r/20260709-james-cs-multiple-per-threads-v1-0-d384e6d477ac@linaro.org

---
James Clark (4):
      coresight: tmc-etr: Prevent per-thread events from sharing a sink
      coresight: tmc-etf: Prevent per-thread events from sharing a sink
      coresight: etb10: Prevent per-thread events from sharing a sink
      coresight: ultrasoc-smb: Prevent per-thread events from sharing a sink

 drivers/hwtracing/coresight/coresight-core.c     | 31 ++++++++++++++++++++++++
 drivers/hwtracing/coresight/coresight-etb10.c    | 30 ++++++-----------------
 drivers/hwtracing/coresight/coresight-priv.h     |  2 --
 drivers/hwtracing/coresight/coresight-tmc-core.c |  2 --
 drivers/hwtracing/coresight/coresight-tmc-etf.c  | 23 ++++++------------
 drivers/hwtracing/coresight/coresight-tmc-etr.c  | 20 +++++----------
 drivers/hwtracing/coresight/coresight-tmc.h      |  2 +-
 drivers/hwtracing/coresight/ultrasoc-smb.c       | 22 +++++------------
 drivers/hwtracing/coresight/ultrasoc-smb.h       |  5 ++--
 include/linux/coresight.h                        |  3 +++
 10 files changed, 64 insertions(+), 76 deletions(-)
---
base-commit: 98495b5a4d77dd22e106f462b76e1093a55b29a7
change-id: 20260708-james-cs-multiple-per-threads-ed1d25ed1734

Best regards,
-- 
James Clark <james.clark@linaro.org>


