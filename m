Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936F6D73E81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 17:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dSI/B5nBL0FfSFAf2HkNbbhIczCpQ7p4U7XSBnDgoAg=; b=lWzuXrJuiPhEItS2GY7HxdxCbB
	+88ra+JWGrNPxff5tETgFoCTKkG4Kmxw8Jzf5rVi3meC2Puea6nHwY75BetDueBIUl9YoyOUVzu4B
	aC/du7tnQlb7KfkymPviwwuYSt4/1fwU4WpoWOjVpeteA9K5t5mBblKA6sO5WDh1tAT5W0PnhmLsP
	Os7+zj1JD1xYynG+EVpaYEPOW+5BW6D293lLxT9E0glMZ3DwgZZ8uEN51qY5R2plXS1XnKAxk3p/3
	40xq6XGvQP8lqwTPF89W+FAfRjsA7KFt7vXlmZxdYeaxFCbxJy+RIpHDKFN6BZpU+eOymV2TanexU
	3cLQaAQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVta-00000000RKw-0GOe;
	Thu, 29 Jan 2026 17:33:30 +0000
Received: from smtprelay0015.hostedemail.com ([216.40.44.15] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlVtX-00000000RKZ-014U
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 17:33:28 +0000
Received: from omf01.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 59957C1143;
	Thu, 29 Jan 2026 17:33:24 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf01.hostedemail.com (Postfix) with ESMTPA id F05996000F;
	Thu, 29 Jan 2026 17:33:20 +0000 (UTC)
Date: Thu, 29 Jan 2026 12:33:33 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: Vincent Donnefort <vdonnefort@google.com>
Cc: mhiramat@kernel.org, mathieu.desnoyers@efficios.com,
 linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev,
 joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 jstultz@google.com, qperret@google.com, will@kernel.org,
 aneesh.kumar@kernel.org, kernel-team@android.com,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 18/30] tracing: Check for undefined symbols in
 simple_ring_buffer
Message-ID: <20260129123333.0fd202f7@gandalf.local.home>
In-Reply-To: <20260126104419.1649811-19-vdonnefort@google.com>
References: <20260126104419.1649811-1-vdonnefort@google.com>
	<20260126104419.1649811-19-vdonnefort@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: F05996000F
X-Stat-Signature: o9j95uhm9j8efrdgmk8y4j5fexwz3idk
X-Rspamd-Server: rspamout08
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX195dtwkrQT53/vFwD6QG82Q6vcucrU+d38=
X-HE-Tag: 1769708000-307468
X-HE-Meta: U2FsdGVkX19dFv0bDGXtajpi9gIAkPXXQ9oDOgmRZBRmxlm8Acxyn18GR3Tmtn0vFh7pabfVByLquAgT+uc4JK6bX73G6GCsvAfGS/gwxwBPOQwg6efHDhZIshRrRudtF8Xkv2LniQiLQTNbanq+fHp3VZd8QtR6DSmd5EmzSb8wqlmsgTyiAcKYhgYLZNDAnf4o0rTenTpSqSV7S5hpSr61etGLq4AFNJD4ZoZUiV7t6YI9WKzH8HoC1PkBaEGlsGQM3Af/ScefsG0V+PKoACC8OlNF28zt5PU+WI+eYBfmHl04QVXgXv0CwYzQUXBXNcLm1kx15d7gLGdHZ7Fqf+DFp1BnPS4UCFrag7mOKL33yhs3WV8KE65DQ2o+fHjeIgRKEs2YaSNcsWEqhPkJdQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_093327_106832_4217920B 
X-CRM114-Status: GOOD (  12.70  )
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

On Mon, 26 Jan 2026 10:44:07 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> The simple_ring_buffer implementation must remain simple enough to be
> used by the pKVM hypervisor. Prevent the object build if unresolved
> symbols are found.
> 
> Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

Reviewed-by: Steven Rostedt (Google) <rostedt@goodmis.org>

-- Steve

> 
> diff --git a/kernel/trace/Makefile b/kernel/trace/Makefile
> index 9e86c43bf320..9f675d5d27c7 100644
> --- a/kernel/trace/Makefile
> +++ b/kernel/trace/Makefile
> @@ -131,4 +131,20 @@ obj-$(CONFIG_TRACE_REMOTE) += trace_remote.o
>  obj-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o
>  obj-$(CONFIG_TRACE_REMOTE_TEST) += remote_test.o
>  
> +#
> +# simple_ring_buffer is used by the pKVM hypervisor which does not have access
> +# to all kernel symbols. Fail the build if forbidden symbols are found.
> +#
> +UNDEFINED_ALLOWLIST := memset alt_cb_patch_nops __x86 __ubsan __asan __kasan __gcov __aeabi_unwind
> +UNDEFINED_ALLOWLIST += __stack_chk_fail stackleak_track_stack __ref_stack __sanitizer
> +UNDEFINED_ALLOWLIST := $(addprefix -e , $(UNDEFINED_ALLOWLIST))
> +
> +quiet_cmd_check_undefined = NM      $<
> +      cmd_check_undefined = test -z "`$(NM) -u $< | grep -v $(UNDEFINED_ALLOWLIST)`"
> +
> +$(obj)/%.o.checked: $(obj)/%.o FORCE
> +	$(call if_changed,check_undefined)
> +
> +always-$(CONFIG_SIMPLE_RING_BUFFER) += simple_ring_buffer.o.checked
> +
>  libftrace-y := ftrace.o


