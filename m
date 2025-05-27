Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 126D1C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 05:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vAdJ/cT5QBHscP2gZxi7G3d4bBHjxu/r9X+j+h7O9D0=; b=q+5JGp1ZgZ+M+0+fHtIoI0ZA+f
	A7bdJD+lkvNSuZv4jIaeFl6k6cPaVgpNe+q5jc2BC5LYabBy2bYJiMw4PObv4y+vOGQv6nmjVLmyn
	9s1veAv+wcMiBXh9C84z4zIHibEkvO/JxVHFRxUic3cs59hNO5GavSf9apbeZ5BCs11BHoKbbtuEd
	NhGsOOxGWrnYrXjPOjEEFOQnRjHIXHLeslyyJZEK+jg0qEh41KtUJVmqj+EtiXYsMEe/+l2QP7b3Y
	kSzJCyLrraGMuDkrTfuynU8Zy70RioEqF0K4tl7JBG8se6mhgBPsiCbg/HzYwD9MGpxoVRySxgqE9
	1qqdkIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJnAw-00000009xf9-2vOW;
	Tue, 27 May 2025 05:48:34 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJn7v-00000009xJH-0wdL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 05:45:28 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-604533a2f62so4530640a12.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 May 2025 22:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748324725; x=1748929525; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vAdJ/cT5QBHscP2gZxi7G3d4bBHjxu/r9X+j+h7O9D0=;
        b=iTJq/tAwrMSRS2BdjQ4QXG89HHuyyUJW61VlIvxWETCPi4cfvnRTeM6c1oZ0JQxmwh
         wgEqbjH4edQFz4NJxf/RAc1Z07VQ35vdLQgJko/ZZHyNtf7yMXscT447JrRHFhBg8uCb
         TMjwswkg5/9dYsFgwv0fwzzOkEx1csT+w4b+ybaDEFwpdMRMSkiS8lWaZCkwfuWNl0UX
         w39PzFD2a9yaaX104tmY5PsyYYzOVaMsNw7fXgnx3O+L2p/jlJ+uRaE7/eAIz9SUYSa2
         1Cvst+AOf3lGl/h+HU13OaBlxJL+H2DkAvn+vhPVDSo5iucvGObUOLpCgmsUoYFL2Yqg
         ZGTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748324725; x=1748929525;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vAdJ/cT5QBHscP2gZxi7G3d4bBHjxu/r9X+j+h7O9D0=;
        b=qUummboX3r8cJJHSP0lwVvWMlZiCu8Y7C19qINXN73FLBbcxO/aRD59Zvk6NdQh/vU
         RqvFGfnNthxSb0RnP3MvJu3pZfWeqabXedjOebIJkLTSjl7M+zduv1tksrQdrJIAvVEs
         S+oUwE4I7KnwUD1K5XCC0Iy374poSLS9EMU+l7OjG54gBxyGJe/O5gopHJp3qI90HQs3
         sM72AWNyt9CTivN0+au77agw7WO5sG7/ApW1g/MGludPCvBQJl3SFHDiQAOhVGBFSPE0
         z0OCIkCSIZiDTwutY2lYOXood2aPGRZj6PNCPs1vY6lBilanKc8DW1tmh9Pwu6QEBWvU
         S5xg==
X-Forwarded-Encrypted: i=1; AJvYcCVcJJ+MtFml+wE1Lrd0cuaIjTjTDoYgZQja+WuTxCnAK9P+XXjodyPG7a1WAhmfgq6JvzHQaO8Bg7kk9JLS6vPF@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7TY3Mtb1dCBHemrufA2t9ZK4lciQZgpeAE6cuQrro9fljyD7E
	NJ4l7nxIAOFMidoI8J9H5mQvDOpjScBkWcPufSEm7puz1vIRlFl5AU4i3wWYlYjZuHc=
X-Gm-Gg: ASbGncsPWJtOts0rfb5f5L6/11E3MOdfunBgeqWvkh+Jq9XvUH550Li4shZVnyLpF2A
	M4utUIi4779RdWYe4l9goCK9UV37ptSiFCpumMjur7Pktqza3vKOoqVWyyn3ze4QpokU/sguumF
	d+Goq98oSSt3aqzUL93ChitGGPjbrfDR1LbbPNwSvnm34SQ+HNiqis37I5K2dCAzUjnTNmBRtby
	LHytzI+s7OmVqBDF4qMhuW5QDgRHuC10m8UcSfTPLYHQh2bXjZJygvCN5U9suyE8tv8E/7vCePF
	XReEPAQaWqVmidZ9DYvuO+rT8ubul0fzIt+HPhlKZzNiQxFKdYveunccM6W4BDT0ucUfsuW346Y
	=
X-Google-Smtp-Source: AGHT+IFjfjGDL9+pR2wI6u63W8YFLk9uDG95aJV/jaoLvZt0KxL00PabZAJ4WGFqwimBN1PB88AkOg==
X-Received: by 2002:a17:906:f58b:b0:ad2:499d:dfdb with SMTP id a640c23a62f3a-ad85b1bd259mr1048071866b.26.1748324725279;
        Mon, 26 May 2025 22:45:25 -0700 (PDT)
Received: from localhost (hf94.n1.ips.mtn.co.ug. [41.210.143.148])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad52d047749sm1788284566b.8.2025.05.26.22.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 22:45:24 -0700 (PDT)
Date: Tue, 27 May 2025 08:45:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] cpuidle: psci: Fix uninitialized variable in
 dt_idle_state_present()
Message-ID: <aDVRcfU8O8sez1x7@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_224527_265344_5AC6E2C3 
X-CRM114-Status: GOOD (  14.02  )
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

If the first cpu_node = of_cpu_device_node_get() fails then the cleanup.h
code will try to free "state_node" but it hasn't been initialized yet.
Declare the device_nodes where they are initialized to fix this.

Fixes: 5836ebeb4a2b ("cpuidle: psci: Avoid initializing faux device if no DT idle states are present")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/cpuidle/cpuidle-psci.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci.c b/drivers/cpuidle/cpuidle-psci.c
index 3c2756a539c4..4e1ba35deda9 100644
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -456,14 +456,13 @@ static struct faux_device_ops psci_cpuidle_ops = {
 
 static bool __init dt_idle_state_present(void)
 {
-	struct device_node *cpu_node __free(device_node);
-	struct device_node *state_node __free(device_node);
-
-	cpu_node = of_cpu_device_node_get(cpumask_first(cpu_possible_mask));
+	struct device_node *cpu_node __free(device_node) =
+			of_cpu_device_node_get(cpumask_first(cpu_possible_mask));
 	if (!cpu_node)
 		return false;
 
-	state_node = of_get_cpu_state_node(cpu_node, 0);
+	struct device_node *state_node __free(device_node) =
+			of_get_cpu_state_node(cpu_node, 0);
 	if (!state_node)
 		return false;
 
-- 
2.47.2


