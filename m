Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E23E7716A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Dec 2024 02:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6knxOhrq01m9fcLE+SYB9TQecvDtnka5bQk5EmhLzdU=; b=YamIDObRlFD4FHHUCmfmO9lHJE
	dxQS1oLgow5r8H8Pujio3RXi1exSo5E4bh2O8Dsf6QiYXVpXCFLdbMbUUaN658klPmOhNvL9a8lMY
	V8rav4YcUtVIofn9SeEwv458nvQzlIsX+ZRUMIj1w4gwmNXdr+R4A1/IaZqFg5Ruv8sBMYlVSBF1B
	qzKMq5Q182OXv3RnRdOFCNMGXQLYkCx7ugto24yAcHWhAJzj0TnsjOKf8K14jm+ms9Mcq3QctaCmh
	h46uj7kYkdGTcSVA3tMmaFoHsY1M/0QsQGsUhBinfalqot5RW6ehOiB15ABARbIxnauKZJIa8bVZK
	KHKUenBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tMeDe-00000007FWs-04Pe;
	Sun, 15 Dec 2024 02:18:54 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tMeCY-00000007FPu-0ZVP;
	Sun, 15 Dec 2024 02:17:47 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso426942f8f.3;
        Sat, 14 Dec 2024 18:17:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734229064; x=1734833864; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6knxOhrq01m9fcLE+SYB9TQecvDtnka5bQk5EmhLzdU=;
        b=dxxgo/QYyvxjyIpDgSJWR4n7Dfp8MFN2e6sBn6xd6D9JJrxiWqfv2KW6mTiy6nKguH
         nlVJap1kErl3m3UxJJiw5zP+pxbELByztTL9Rn6PCrs8X9J5Jk/KuZA54p5I3PiP70Rd
         O8t/jLwzGvnT+xSRJ1e9DHYTaDOtU2WM1zhqk13p3xRhvYYhAk5czKuQE8oP4C+7UahH
         aa/qn1KatProt20Vvs5EkSqD1GHWm5RweHUwjQbITDlPVzE0GtZUeKGFRxOsCAA+1E06
         yC2XK8YPgmxuWKCHQoxNbZaXsel+zY4ncmR+21sfPKHhyw23vioW2254fjomQkj7lTck
         ufbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734229064; x=1734833864;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6knxOhrq01m9fcLE+SYB9TQecvDtnka5bQk5EmhLzdU=;
        b=ooAYVPGmOfQnpNBW3S2TwRpRNLWc5TkQOARcxs0nSiobuHzJd4ivHZKP/u8hYmiHVo
         N/uf2c+42+BKg8YGNi/QVRENSUIbssXNehesgEn84KEquiCb0IdM37bcWJNVwWnTowDj
         oZhg41/AbGP5b7a2ciyVsPpClTJmDTKoVF2lmVXf3FW9mIK2HNSIsqMbcxrY8ZNYC2ZB
         CTSbJ5axQSxELvQZkZXtzkJJJ21srKo1AZ7MwFuMxdCdmuorgoHpPlAxY5Wwb94gEG4P
         27M7tBqaQOsHdfy0PaKPdy2uw4OkpY9xTFeZhsbZf9fiC5Se4Xu6/a8BopkXSupDXEMd
         Y/Bw==
X-Forwarded-Encrypted: i=1; AJvYcCWhpL52M2blBMc9OLAexO8uKX7+8e38E2U8WliAwp8aK0cIq+3umguPlvyq7rvZjrYAmMEotY/rcPsq+FCYmt8=@lists.infradead.org, AJvYcCXE/GV/EiN5TTvhV83K2fAOs+G9NMSqeswqoKLjj7p3OWPyLsfVmslYuDoGC66kMkYh1/Es3fVQEANCRmp0sBVc@lists.infradead.org
X-Gm-Message-State: AOJu0YyFXqeomorKUO74/OoDFwk6dPMb4kUebVV8cn0bRE9as9+STaxR
	EY7/NZTGSW09z4YHGMdEGEdwtaF+zR5eVPx8ywhFgZE4sZZmuRyX
X-Gm-Gg: ASbGncvZ6T5K2lWtqPx751c/VQ5WeJKrOHhEqk8H/0BpZZ/s0CkXxLYAbuqLWdBq/fC
	G59wicqOPyLDBFrkeMVh7KxtmoFuzCv4NpdK7gsuVqq23ZtnLfeof31Klk8RoxqaSlt1GiFlD9K
	de4tWs43Asc7FxP2CNJywEzNT9KPl3tPPLfTZGBR6fnAnR2or8N59qUk0Eh3AYTRDbyusz3sd1n
	r2xW/DqaRYpewt7P0zRO9ZsQOAjUcrVL5FsQApE74U7/Yg5gm2GnNZ7xw==
X-Google-Smtp-Source: AGHT+IGLJ1W2T/hdbQdiCIBZkecDQtKrwoetGyA3/aLLuNgM4a1Dyf+OebwoRNCRaca4jYV/KL/34w==
X-Received: by 2002:a5d:6c68:0:b0:385:df84:8496 with SMTP id ffacd0b85a97d-38880ac60d1mr5709653f8f.3.1734229063677;
        Sat, 14 Dec 2024 18:17:43 -0800 (PST)
Received: from [192.168.0.2] ([69.6.8.124])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-388c8046dabsm4111731f8f.81.2024.12.14.18.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Dec 2024 18:17:42 -0800 (PST)
Message-ID: <da90f64c-260a-4329-87bf-1f9ff20a5951@gmail.com>
Date: Sun, 15 Dec 2024 04:17:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net v2] net: wwan: t7xx: Fix FSM command timeout issue
To: Jinjian Song <jinjian.song@fibocom.com>,
 chandrashekar.devegowda@intel.com, chiranjeevi.rapolu@linux.intel.com,
 haijun.liu@mediatek.com, ricardo.martinez@linux.intel.com,
 loic.poulain@linaro.org, johannes@sipsolutions.net, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 corbet@lwn.net, linux-mediatek@lists.infradead.org, helgaas@kernel.org,
 danielwinkler@google.com, korneld@google.com, andrew+netdev@lunn.ch,
 horms@kernel.org
References: <20241213064720.122615-1-jinjian.song@fibocom.com>
Content-Language: en-US
From: Sergey Ryazanov <ryazanov.s.a@gmail.com>
In-Reply-To: <20241213064720.122615-1-jinjian.song@fibocom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241214_181746_225445_997D2576 
X-CRM114-Status: GOOD (  25.53  )
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

Hello Jinjian,

Nice catch! Suddenly, the proposed fix is not complete, we still have 
issues with memory use after free. Please find details below.

On 13.12.2024 08:47, Jinjian Song wrote:
> When driver processes the internal state change command, it use an
> asynchronous thread to process the command operation. If the main
> thread detects that the task has timed out, the asynchronous thread
> will panic when executing the completion notification because the
> main thread completion object has been released.
> 
> BUG: unable to handle page fault for address: fffffffffffffff8
> PGD 1f283a067 P4D 1f283a067 PUD 1f283c067 PMD 0
> Oops: 0000 [#1] PREEMPT SMP NOPTI
> RIP: 0010:complete_all+0x3e/0xa0
> [...]
> Call Trace:
>   <TASK>
>   ? __die_body+0x68/0xb0
>   ? page_fault_oops+0x379/0x3e0
>   ? exc_page_fault+0x69/0xa0
>   ? asm_exc_page_fault+0x22/0x30
>   ? complete_all+0x3e/0xa0
>   fsm_main_thread+0xa3/0x9c0 [mtk_t7xx (HASH:1400 5)]
>   ? __pfx_autoremove_wake_function+0x10/0x10
>   kthread+0xd8/0x110
>   ? __pfx_fsm_main_thread+0x10/0x10 [mtk_t7xx (HASH:1400 5)]
>   ? __pfx_kthread+0x10/0x10
>   ret_from_fork+0x38/0x50
>   ? __pfx_kthread+0x10/0x10
>   ret_from_fork_asm+0x1b/0x30
>   </TASK>
> [...]
> CR2: fffffffffffffff8
> ---[ end trace 0000000000000000 ]---
> 
> After the main thread determines that the task has timed out, mark
> the completion invalid, and add judgment in the asynchronous task.
> 
> Fixes: d785ed945de6 ("net: wwan: t7xx: PCIe reset rescan")

The completion waiting was introduced in a different commit. I believe, 
the fix tag should be 13e920d93e37 ("net: wwan: t7xx: Add core components")

> Signed-off-by: Jinjian Song <jinjian.song@fibocom.com>
> ---
>   drivers/net/wwan/t7xx/t7xx_state_monitor.c | 7 +++++--
>   1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/net/wwan/t7xx/t7xx_state_monitor.c b/drivers/net/wwan/t7xx/t7xx_state_monitor.c
> index 3931c7a13f5a..57f1a7730fff 100644
> --- a/drivers/net/wwan/t7xx/t7xx_state_monitor.c
> +++ b/drivers/net/wwan/t7xx/t7xx_state_monitor.c
> @@ -108,7 +108,8 @@ static void fsm_finish_command(struct t7xx_fsm_ctl *ctl, struct t7xx_fsm_command
>   {
>   	if (cmd->flag & FSM_CMD_FLAG_WAIT_FOR_COMPLETION) {
>   		*cmd->ret = result;

The memory for the result storage is allocated on the stack as well. And 
writing it unconditionally can cause unexpected consequences.

> -		complete_all(cmd->done);
> +		if (cmd->done)
> +			complete_all(cmd->done);
>   	}
>   
>   	kfree(cmd);
> @@ -503,8 +504,10 @@ int t7xx_fsm_append_cmd(struct t7xx_fsm_ctl *ctl, enum t7xx_fsm_cmd_state cmd_id
>   
>   		wait_ret = wait_for_completion_timeout(&done,
>   						       msecs_to_jiffies(FSM_CMD_TIMEOUT_MS));
> -		if (!wait_ret)
> +		if (!wait_ret) {
> +			cmd->done = NULL;

We cannot access the command memory here, since fsm_finish_command() 
could release it already.

>   			return -ETIMEDOUT;
> +		}
>   
>   		return ret;
>   	}

Here we have an ownership transfer problem and a driver author has tried 
to solve it, but as noticed, we are still experiencing issues in case of 
timeout.

The command completion routine should not release the command memory 
unconditionally. Looks like the references counting approach should help 
us here. E.g.
1. grab a reference before we put a command into the queue
1.1. grab an extra reference if we are going to wait the completion
2. release the reference as soon as we are done with the command execution
3. in case of completion waiting release the reference as soon as we are 
done with waiting due to completion or timeout

Could you try the following patch? Please note, besides the reference 
counter introduction it also moves completion and result storage inside 
the command structure as advised by the completion documentation.


--- a/drivers/net/wwan/t7xx/t7xx_state_monitor.h
+++ b/drivers/net/wwan/t7xx/t7xx_state_monitor.h
@@ -109,8 +109,9 @@ struct t7xx_fsm_command {
  	struct list_head	entry;
  	enum t7xx_fsm_cmd_state	cmd_id;
  	unsigned int		flag;
-	struct completion	*done;
-	int			*ret;
+	struct completion	done;
+	int			result;
+	struct struct kref	refcnt;
  };

  struct t7xx_fsm_notifier {
--- a/drivers/net/wwan/t7xx/t7xx_state_monitor.c
+++ b/drivers/net/wwan/t7xx/t7xx_state_monitor.c
@@ -97,14 +97,20 @@ void t7xx_fsm_broadcast_state(struct t7xx_fsm_ctl 
*ctl, enum md_state state)
  	fsm_state_notify(ctl->md, state);
  }

+static void fsm_release_command(struct kref *ref)
+{
+	struct t7xx_fsm_command *cmd = container_of(ref, typeof(*cmd), refcnt);
+	kfree(cmd);
+}
+
  static void fsm_finish_command(struct t7xx_fsm_ctl *ctl, struct 
t7xx_fsm_command *cmd, int result)
  {
  	if (cmd->flag & FSM_CMD_FLAG_WAIT_FOR_COMPLETION) {
-		*cmd->ret = result;
+		cmd->result = result;
  		complete_all(cmd->done);
  	}

-	kfree(cmd);
+	kref_put(&cmd->refcnt, fsm_release_command);
  }

  static void fsm_del_kf_event(struct t7xx_fsm_event *event)
@@ -396,7 +402,6 @@ static int fsm_main_thread(void *data)

  int t7xx_fsm_append_cmd(struct t7xx_fsm_ctl *ctl, enum 
t7xx_fsm_cmd_state cmd_id, unsigned int flag)
  {
-	DECLARE_COMPLETION_ONSTACK(done);
  	struct t7xx_fsm_command *cmd;
  	unsigned long flags;
  	int ret;
@@ -408,11 +413,13 @@ int t7xx_fsm_append_cmd(struct t7xx_fsm_ctl *ctl, 
enum t7xx_fsm_cmd_state cmd_id
  	INIT_LIST_HEAD(&cmd->entry);
  	cmd->cmd_id = cmd_id;
  	cmd->flag = flag;
+	kref_init(&cmd->refcnt);
  	if (flag & FSM_CMD_FLAG_WAIT_FOR_COMPLETION) {
-		cmd->done = &done;
-		cmd->ret = &ret;
+		init_completion(&cmd->done);
+		kref_get(&cmd->refcnt);
  	}

+	kref_get(&cmd->refcnt);
  	spin_lock_irqsave(&ctl->command_lock, flags);
  	list_add_tail(&cmd->entry, &ctl->command_queue);
  	spin_unlock_irqrestore(&ctl->command_lock, flags);
@@ -422,10 +429,10 @@ int t7xx_fsm_append_cmd(struct t7xx_fsm_ctl *ctl, 
enum t7xx_fsm_cmd_state cmd_id
  	if (flag & FSM_CMD_FLAG_WAIT_FOR_COMPLETION) {
  		unsigned long wait_ret;

-		wait_ret = wait_for_completion_timeout(&done,
+		wait_ret = wait_for_completion_timeout(&cmd->done,
  						       msecs_to_jiffies(FSM_CMD_TIMEOUT_MS));
-		if (!wait_ret)
-			return -ETIMEDOUT;
+		ret = wait_ret ? cmd->result : -ETIMEDOUT;
+		kref_put(&cmd->refcnt, fsm_release_command);

  		return ret;
  	}

--
Sergey

