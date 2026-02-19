Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0021E9A048
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 14:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VP5jSMt462Cdg9Mi+06pzRaV71iOaEOeVVz2yGEPKdA=; b=UZB3QhkRuiu3OjZ4kBfBbOdQdT
	F9+C9oWYgvNr/WQa5+WD4rYQJXS5B8EhVS5E/FZOfnl+1wb0MFUVUf+623lSAp/GqY1ZcylIFlxJy
	5r7waX61p9uy5tBsbJ4pAh2uItK8nljicQk8bJ/dHFOXSh5jLIMNSXRZQyCMKwqsrUF0QYU6hUOuY
	ZCAmtKTW00VTZYKkPzBfN3kE/K7I60g5YFB5rZXW0tBcC1mroUr39O+5YGLKCQPliDUlbc26g1XAi
	fNfAAvS/6Eq/bfY1qBsQnVvmUVoBDbCnSqI4pueI2fbJIX91g7QuEXTjTPWRMeEFgiFZ1aVKSHjD0
	RpjUcscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt58a-0000000BSz6-0cjH;
	Thu, 19 Feb 2026 14:36:16 +0000
Received: from smtprelay0014.hostedemail.com ([216.40.44.14] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vt58X-0000000BSye-2Wtw
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 14:36:15 +0000
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 691CA1A056C;
	Thu, 19 Feb 2026 14:36:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf05.hostedemail.com (Postfix) with ESMTPA id 7FEC32000D;
	Thu, 19 Feb 2026 14:36:04 +0000 (UTC)
Date: Thu, 19 Feb 2026 09:36:05 -0500
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
Message-ID: <20260219093605.192fdb48@gandalf.local.home>
In-Reply-To: <aYtUqOw8SdX7gqZT@google.com>
References: <20260131132848.254084-1-vdonnefort@google.com>
	<20260131132848.254084-16-vdonnefort@google.com>
	<20260205124208.2ed7cff8@gandalf.local.home>
	<aYtUqOw8SdX7gqZT@google.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 7FEC32000D
X-Stat-Signature: md7qtgedn665okqptay4z4jimakth6k8
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX19TKj9CWzYjBj2NgmYOuR8HcgsdxJld1Oo=
X-HE-Tag: 1771511764-166707
X-HE-Meta: U2FsdGVkX1+y78bFA5Fh2e1MOsjN889PeyB/43QOfqL4DGisxGUCImil6IIXRs8fQJR5JZJFm/Zxf+B5pGcquvp6c8BKMqg0mUGcFRg1SoBJr/iNjYh/y+crvZDam9BCvS4tbHRGLeKyP/YRN78HcJBHPw3uz8tBRwhWhEpM/Ai3txTZW6rmFVeIlOIZ+kqWcmVUkXGJl8v4I3ACJIdwqGqBbNPdp5kDfmgun+cpiGem6Gj9q+/rrCRdF/OBjS2UsquDN+nQBOJe75u1Ftck2a9Pd8tpBvnPXAqeWLzz1eLVyax13XfwG6w0wtoPlB/uC4EdHvC0B4PTi9ocnf7xgSIoCxEqcxKu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_063613_710402_4AC2B79D 
X-CRM114-Status: UNSURE (   8.52  )
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

On Tue, 10 Feb 2026 15:54:16 +0000
Vincent Donnefort <vdonnefort@google.com> wrote:

> Hum weird, I have changed it in v11 to 
> 
> echo 0 > /sys/devices/system/cpu/cpu$cpu/online || return 0
> 
> That doesn't work? Because I would simply stop the test there if we can't
> offline the CPU.


Yeah, I guess I was running the old tests. With the new tests I now have:

tools/testing/selftests/ftrace# ./ftracetest test.d/remotes/
=== Ftrace unit tests ===
[1] Test trace remote buffer size	[PASS]
[2] Test hypervisor trace buffer size	[UNSUPPORTED]
[3] Test hypervisor trace buffer reset	[UNSUPPORTED]
[4] Test hypervisor consuming trace read	[UNSUPPORTED]
[5] Test hypervisor non-consuming trace read	[UNSUPPORTED]
[6] Test hypervisor trace buffer unloading	[UNSUPPORTED]
[7] Test trace remote reset	[PASS]
[8] Test trace remote consuming read	[PASS]
[9] Test trace remote non-consuming read	[PASS]
[10] Test trace remote unloading	[PASS]


# of passed:  5
# of failed:  0
# of unresolved:  0
# of untested:  0
# of unsupported:  5
# of xfailed:  0
# of undefined(test bug):  0

-- Steve

