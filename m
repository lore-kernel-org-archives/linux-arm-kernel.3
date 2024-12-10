Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33CC5E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:54:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PWU2eVhMhcb/iJGFd+VmNM2XsfhPsakUhRt7/wk/dGA=; b=1o9UeMJTDd4rHa1ofv/HCuJI+o
	wiE2k90Ou2laCgJ4lPvRfamKdoaomq80DUQ0h1TyEVRMdDBEW1dR+q2IrlC12KY5E+oaUaMqfBc8L
	UA1xge6QkrCRwpArqjnZeO3cfiwe+E668lgmsFM3+gVVnd6rimDHvHM9/FOZO1o62I5GSN9DpFqyl
	8MzzsWiS6e+DtmNdtizQU6zXW2F+5nPA8B9hK4GFZ9HtN51u0RX1Z67s0rxz8vAizlJdxjCygEeIr
	11A08rN04B0u82qAhUv6jM9VJZ/VgAi6eHzycL6vrFe8fSBBMQ7xV4yr+RWc08TMroKPZlxTeiHX6
	zavsvp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1cr-0000000Brl2-12C9;
	Tue, 10 Dec 2024 14:54:13 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL1Zz-0000000BqyU-0Aey
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:51:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-385f06d0c8eso2648152f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Dec 2024 06:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733842272; x=1734447072; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PWU2eVhMhcb/iJGFd+VmNM2XsfhPsakUhRt7/wk/dGA=;
        b=aZb1jVVLHLo/g1MGAv5dXKlRENXaPVb8qn7pUSo842qmda0fUW9bwzSqijqdjZNqOO
         Im8sPTa4JUem52r25Tt6oxF7yCg0gBP4oUPM6baFA8m0WZFwtKlhk0PJFy9czpFPqbzP
         hler6HD3s4/cLEWfSXkcNUaYiF1IT9mYc0a/R5waSzsHZ2WbveDdmfXKzfgMdZ6FSPqw
         mkO67Joxx4SL2fvWEae0Rury5ME28awY25BpQqGjr6cUVQ01WX+uAvoLqNycYYr5vZFN
         itNH1iCj1rpuIWAAhZQFgwM24P9mC8r4xSVpzGXcNWWDQNlg9fWW3EEyVkHTqjr9m/PU
         Io9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733842272; x=1734447072;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PWU2eVhMhcb/iJGFd+VmNM2XsfhPsakUhRt7/wk/dGA=;
        b=qdA6fE8cJaGw3p3YvVGbntH4SF7xewkuDRRcsae4zVLwLHMfU148sf/lBtjaBaxTUA
         EMsS6YFfx/m6ECPiJjbkT5V3/QHQV77D76VRABUUnMpytVUhlSoX3vm+cQ2511ZaAYK0
         lQqCA5fKQ4aPcmYXmrm91PgIoZPEj9P8K4GIqTIPXXuBjhGllw+GYZ33hvGvAhqKAtOm
         MbLx1Gv4wqKQGk1ixIKztrbJTyg+F5lKme7VWYBY9W5x4AEv1dSWBcgXfwzJ8R0lKTQV
         0nr5RNjHDC1FYPpri9q/lAGkAssXc9c45vrCdwwMjLhh4KzW/r7zOn9ipplYfl/hR/AQ
         pIlg==
X-Forwarded-Encrypted: i=1; AJvYcCXhqDtwm0GwflX0TyWQH7HD2zsvZyMjogRfenj+JgzWo61DfXExHCV56V+XXPNx5mp2b2occt4qtnwJf4gaE9Nm@lists.infradead.org
X-Gm-Message-State: AOJu0YypRyZ2lTPMltnPWLL3oX7LOcqLiq+fjYfY2YYeSEOu5Z0bhvzG
	c9Ylon72Envc/PZ0Ad9K9HOr13xx+NtQ3le4ls04/Ci/ip83TI1d+jhoqQZww24=
X-Gm-Gg: ASbGnctDQ2ypQQLvVHLHKWqO7MPS+thJ60I6/CGRVCuhWvv5u3r+hvbA6YbZs1KMyKo
	RRzPdgvBJRUO4AIgBeLEqnHWxkhF8wb2nnHKP5FzqShLkXx2avP85leroENTXfifxSjI/xl4QoP
	X3zfX9OyGn6CAU7GEBcWBaG4v+LLHJSshXXzQw0ZhmDBXCTvCO69njTWhkxTq2F4RjNk+MK2TiT
	tKpc3bwxyY3k5y+pbF/QUJMgedBmoTgN6g3U03iHmGpFCVOjyuJO4w=
X-Google-Smtp-Source: AGHT+IG40tI08nse8JUwHqIkYlScp+nI0cpXGiTCqsdS3M7WqGX1DoAKZIPNJ0b6mJGMqFr9aOshZw==
X-Received: by 2002:a05:6000:1862:b0:386:62f:cf18 with SMTP id ffacd0b85a97d-386453fbdd6mr3663152f8f.49.1733842272254;
        Tue, 10 Dec 2024 06:51:12 -0800 (PST)
Received: from pop-os.. ([209.198.129.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38637445f13sm9879198f8f.35.2024.12.10.06.51.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 06:51:11 -0800 (PST)
From: James Clark <james.clark@linaro.org>
To: coresight@lists.linaro.org
Cc: yeoreum.yun@arm.com,
	James Clark <james.clark@linaro.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Leo Yan <leo.yan@linux.dev>,
	Namhyung Kim <namhyung@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] coresight: docs: Remove target sink from examples
Date: Tue, 10 Dec 2024 14:49:28 +0000
Message-Id: <20241210144933.295798-1-james.clark@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_065115_905013_089FF444 
X-CRM114-Status: GOOD (  19.98  )
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

Previously the sink had to be specified, but now it auto selects one by
default. Including a sink in the examples causes issues when copy
pasting the command because it might not work if that sink isn't
present. Remove the sink from all the basic examples and create a new
section specifically about overriding the default one.

Make the text a but more concise now that it's in the advanced section,
and similarly for removing the old kernel advice.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 Documentation/trace/coresight/coresight.rst   | 41 ++++++++-----------
 .../userspace-api/perf_ring_buffer.rst        |  4 +-
 2 files changed, 18 insertions(+), 27 deletions(-)

diff --git a/Documentation/trace/coresight/coresight.rst b/Documentation/trace/coresight/coresight.rst
index d4f93d6a2d63..806699871b80 100644
--- a/Documentation/trace/coresight/coresight.rst
+++ b/Documentation/trace/coresight/coresight.rst
@@ -462,44 +462,35 @@ queried by the perf command line tool:
 
 		cs_etm//                                    [Kernel PMU event]
 
-	linaro@linaro-nano:~$
-
 Regardless of the number of tracers available in a system (usually equal to the
 amount of processor cores), the "cs_etm" PMU will be listed only once.
 
 A Coresight PMU works the same way as any other PMU, i.e the name of the PMU is
-listed along with configuration options within forward slashes '/'.  Since a
-Coresight system will typically have more than one sink, the name of the sink to
-work with needs to be specified as an event option.
-On newer kernels the available sinks are listed in sysFS under
+provided along with configuration options within forward slashes '/' (see
+`Config option formats`_).
+
+Advanced Perf framework usage
+-----------------------------
+
+Sink selection
+~~~~~~~~~~~~~~
+
+An appropriate sink will be selected automatically for use with Perf, but since
+there will typically be more than one sink, the name of the sink to use may be
+specified as a special config option prefixed with '@'.
+
+The available sinks are listed in sysFS under
 ($SYSFS)/bus/event_source/devices/cs_etm/sinks/::
 
 	root@localhost:/sys/bus/event_source/devices/cs_etm/sinks# ls
 	tmc_etf0  tmc_etr0  tpiu0
 
-On older kernels, this may need to be found from the list of coresight devices,
-available under ($SYSFS)/bus/coresight/devices/::
-
-	root:~# ls /sys/bus/coresight/devices/
-	 etm0     etm1     etm2         etm3  etm4      etm5      funnel0
-	 funnel1  funnel2  replicator0  stm0  tmc_etf0  tmc_etr0  tpiu0
 	root@linaro-nano:~# perf record -e cs_etm/@tmc_etr0/u --per-thread program
 
-As mentioned above in section "Device Naming scheme", the names of the devices could
-look different from what is used in the example above. One must use the device names
-as it appears under the sysFS.
-
-The syntax within the forward slashes '/' is important.  The '@' character
-tells the parser that a sink is about to be specified and that this is the sink
-to use for the trace session.
-
 More information on the above and other example on how to use Coresight with
 the perf tools can be found in the "HOWTO.md" file of the openCSD gitHub
 repository [#third]_.
 
-Advanced perf framework usage
------------------------------
-
 AutoFDO analysis using the perf tools
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
@@ -508,7 +499,7 @@ perf can be used to record and analyze trace of programs.
 Execution can be recorded using 'perf record' with the cs_etm event,
 specifying the name of the sink to record to, e.g::
 
-    perf record -e cs_etm/@tmc_etr0/u --per-thread
+    perf record -e cs_etm//u --per-thread
 
 The 'perf report' and 'perf script' commands can be used to analyze execution,
 synthesizing instruction and branch events from the instruction trace.
@@ -572,7 +563,7 @@ sort example is from the AutoFDO tutorial (https://gcc.gnu.org/wiki/AutoFDO/Tuto
 	Bubble sorting array of 30000 elements
 	5910 ms
 
-	$ perf record -e cs_etm/@tmc_etr0/u --per-thread taskset -c 2 ./sort
+	$ perf record -e cs_etm//u --per-thread taskset -c 2 ./sort
 	Bubble sorting array of 30000 elements
 	12543 ms
 	[ perf record: Woken up 35 times to write data ]
diff --git a/Documentation/userspace-api/perf_ring_buffer.rst b/Documentation/userspace-api/perf_ring_buffer.rst
index bde9d8cbc106..dc71544532ce 100644
--- a/Documentation/userspace-api/perf_ring_buffer.rst
+++ b/Documentation/userspace-api/perf_ring_buffer.rst
@@ -627,7 +627,7 @@ regular ring buffer.
 AUX events and AUX trace data are two different things.  Let's see an
 example::
 
-        perf record -a -e cycles -e cs_etm/@tmc_etr0/ -- sleep 2
+        perf record -a -e cycles -e cs_etm// -- sleep 2
 
 The above command enables two events: one is the event *cycles* from PMU
 and another is the AUX event *cs_etm* from Arm CoreSight, both are saved
@@ -766,7 +766,7 @@ only record AUX trace data at a specific time point which users are
 interested in.  E.g. below gives an example of how to take snapshots
 with 1 second interval with Arm CoreSight::
 
-  perf record -e cs_etm/@tmc_etr0/u -S -a program &
+  perf record -e cs_etm//u -S -a program &
   PERFPID=$!
   while true; do
       kill -USR2 $PERFPID
-- 
2.34.1


