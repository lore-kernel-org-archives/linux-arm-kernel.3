Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79C36ECD994
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 17:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=owxhRFXXXp5tKpxr1x72jU0ZyxfTAVdp3dG4BkXD5nk=; b=G2AUo0h6K8p+hoMRrT72k3vq3B
	mCyEcx3HXMYGCbk8BPi7vDgAqILhvWfcr2tM9aRBZgEQf0PQVKB1+cHI9OXJyI7vGVObRbbKpeVh+
	EwKnzyrZMFC2DDwYsw1llyT85i9PHpxMATptWSoUpGxAKf66Gt4XL//CnE7H70+OBrfVHHfnbvqbt
	3W1RiSj8y9LptBHL3PM6oA/TrpxzGZpXBT4tp4FUJwvmLkm8lNlevRuXjM10TN7nSoxcmPff2NzqL
	vU5lUpmnRg+hvv+C4aOgTg6r51AtUC2g12fESkZeRDumcwJgNMPslsN9J7GOyotIxbmT35iFTlRt/
	vnZtHqBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3MP-0000000AJTk-2koG;
	Thu, 05 Feb 2026 17:41:47 +0000
Received: from smtprelay0010.hostedemail.com ([216.40.44.10] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vo3MM-0000000AJSn-3Sk2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Feb 2026 17:41:44 +0000
Received: from omf07.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 0A3238C109;
	Thu,  5 Feb 2026 17:41:37 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf07.hostedemail.com (Postfix) with ESMTPA id 1CB9120024;
	Thu,  5 Feb 2026 17:41:34 +0000 (UTC)
Date: Thu, 5 Feb 2026 12:42:08 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v11 15/30] tracing: selftests: Add trace remote tests
Message-ID: <20260205124208.2ed7cff8@gandalf.local.home>
In-Reply-To: <20260131132848.254084-16-vdonnefort@google.com>
References: <20260131132848.254084-1-vdonnefort@google.com>
	<20260131132848.254084-16-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 1CB9120024
X-Stat-Signature: xrqfaergycraki9ixirzx4pqwqpkshpz
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/AAJG0H2Y0nJ6yIVW93vc/rmOZvsTHdvc=
X-HE-Tag: 1770313294-751280
X-HE-Meta: U2FsdGVkX1+uuRgLPQ0ZgTKxMjzwxSS3wkxfEc/ttq2P0equ3WYuTk1Eo8BUqwVZX+pHP5PyilUVvCZrp/Id69DfyKfI2Lcp/JUghTpize8GQcHlrhj+pA1vcARhFNwS9fozq1kAOB1M5jjdhbgyyftg7E6q0Tm13V0vgY0dBYjaHm8CJ9e43ks2XZGIkfziMs32Vie/pcc9aL59qt67rJDOd8YNL9sFIg4S/bmc3qWX6TEookAaDBK0BzqiQTGiYhmLBwffXuSRZsCBHFPgG/lyEUt40fCk9nEWr/1+qTYjj82gzk1WqrJTqJK1Isyl4D6JObzKUKNVidE/baBu0TfHLiCDT7J7kI1mj9b80sNlo4rLU0R/bknCw+sIoPJs4g4uWStQ1N19ite56C3RWzGZxfFk+rXqZPVMs/Cnb5Q=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_094142_950431_E143C5A1 
X-CRM114-Status: GOOD (  10.80  )
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

On Sat, 31 Jan 2026 13:28:33 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Exercise the tracefs interface for trace remote with a set of tests to
> check:
> 
>   * loading/unloading (unloading.tc)
>   * reset (reset.tc)
>   * size changes (buffer_size.tc)
>   * consuming read (trace_pipe.tc)
>   * non-consuming read (trace.tc)
> 
> Cc: Shuah Khan <skhan@linuxfoundation.org>
> Cc: linux-kselftest@vger.kernel.org
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

This still fails:

=== Ftrace unit tests ===
[1] Test trace remote buffer size	[PASS]
[2] Test hypervisor trace buffer size	[UNSUPPORTED]
[3] Test hypervisor trace buffer reset	[UNSUPPORTED]
[4] Test hypervisor consuming trace read	[UNSUPPORTED]
[5] Test hypervisor non-consuming trace read	[UNSUPPORTED]
[6] Test hypervisor trace buffer unloading	[UNSUPPORTED]
[7] Test trace remote reset	[PASS]
[8] Test trace remote consuming read	[FAIL]
[9] Test trace remote non-consuming read	[FAIL]
[10] Test trace remote unloading	[PASS]

I added this patch and the two failed tests now pass:

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/trace.tc b/tools/testing/selftests/ftrace/test.d/remotes/trace.tc
index 081133ec45ff..dfc954a6a380 100644
--- a/tools/testing/selftests/ftrace/test.d/remotes/trace.tc
+++ b/tools/testing/selftests/ftrace/test.d/remotes/trace.tc
@@ -106,8 +106,10 @@ test_trace()
     echo 0 > trace
 
     for cpu in $(get_cpu_ids); do
-        echo 0 > /sys/devices/system/cpu/cpu$cpu/online
-        break
+        if [ -f /sys/devices/system/cpu/cpu$cpu/online ]; then
+            echo 0 > /sys/devices/system/cpu/cpu$cpu/online
+            break
+        fi
     done
 
     for i in $(seq 1 8); do
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
index d28eaee10c7c..146f0a9fe311 100644
--- a/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
+++ b/tools/testing/selftests/ftrace/test.d/remotes/trace_pipe.tc
@@ -102,8 +102,10 @@ test_trace_pipe()
     echo 0 > trace
 
     for cpu in $(get_cpu_ids); do
-        echo 0 > /sys/devices/system/cpu/cpu$cpu/online
-        break
+        if [ -f /sys/devices/system/cpu/cpu$cpu/online ]; then
+            echo 0 > /sys/devices/system/cpu/cpu$cpu/online
+            break
+        fi
     done
 
     for i in $(seq 1 8); do

-- Steve

