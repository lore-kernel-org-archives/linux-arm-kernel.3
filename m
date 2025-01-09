Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77601E77197
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jan 2025 15:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=; b=IVQFIu2BVqdp20HTCr2X54l7nk
	qec9brJQrwRcjEYGdir/EIzzI2xf7EWVZzTZr9HlPZi7kKFCdpp1hs8QTBev8uGfx9t6GL+okpA9S
	P617T3LltUpukAIEYIpkq39+8EAhFbFWRCGuOFy+izsz8g/ITJIO/g6oMNZY8zqUiuiuOa61rthx8
	6JNQZdPNdnG8UUa+qzO6oJgkxzoV7kz9/+dUxxTZAv9O31jejOgMqRnOjIQLN3PFqUMWfm4qOQD9x
	r5ubsn9yQkfhxawbRTBocVKOrsxs6Bf4v7T7RvlwdCvqbZhXz0M+PoSMT9Jo8K0FlxXqUn6OX9omj
	nTZ25TaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVukH-0000000CX2m-2wnH;
	Thu, 09 Jan 2025 15:46:53 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVuj3-0000000CWf3-3fsO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Jan 2025 15:45:39 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-71e157a79c8so289685a34.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Jan 2025 07:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=minyard-net.20230601.gappssmtp.com; s=20230601; t=1736437536; x=1737042336; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
        b=V+xIZFRRXjjkjXNKCh/p6QquS7JPNASpAxp2k58+8qW6xMRQDkpnj/0zlMvpzyjPZU
         jaGBWj9HbUvA2uDBQ6XsxiHJtOfikcZRTYbIIBE9i2OO011yRosjTs+oGDHxEs3PsjAS
         zIoAjOeY8/Wh94XNNfFQipFw3jwA53msoo7BxQsStsj3FSeGxDL0Die/gaehMiS6gUgU
         ZGeBBtzDxtoYT9xQQSJcxLcjF5lhTtF7Di+8FdbFdnQaLnQcr7YU19iRV+1EbOvECIpB
         IMb49r4V3kPn/cIMkuzrvg10ciYGYtQJBimtCVZfEEEmtcIBLOMjF+niuMRV2+Ou72iK
         43bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736437536; x=1737042336;
        h=in-reply-to:content-disposition:mime-version:references:reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgTp2x21PamB5G5tjbV3jPSQRWSgTUkiJmrzV93coW4=;
        b=rv97n37RUhjnlizIocIRCHXIn50KHQA55iIonif4zdHk277inYH020GWZWZeCXj1bW
         nwD60DL0k+ifgVzjw4tif9QMWD980nldZgu2pCzrf/ymtfXVRAuEj1ROsBdQ36pdwPXK
         6o1dcDvq3MlISAWIMUUHiOTdYis58mfoyyeILn3mHc6KEfh44yK/4CHcT7EfeJ5hkijf
         RPEnb+1q3dbtFOR2e+u1g4am/A/H1w3oELgnlYPxDwnVCj0+EAxBrS+/HMTFscRjwCoF
         aFtJaDtNS/9WOJmcJVJxK/aYYUqFEJUea5FeAD6Y5hMffNotsB6nGx/8IExu0V/mb0tl
         zztA==
X-Forwarded-Encrypted: i=1; AJvYcCXqHdTzWMF9Px56WrCYyZGnxotSvhpvKJLnjCM7E5fSiq8yvgmW5pC/JizBD/IOzGRe6aA3xinZitWlPoRsZg8k@lists.infradead.org
X-Gm-Message-State: AOJu0YxhYmw95eye/fz3oMBUgQRoTQ53rte8WDH0o+nIXwM7Uowme/q/
	SdQgjWkuL9fEaigwflYzuuuEaq2TcOprfwq7x0RYkOV1pTviB7JPPfCe9IsjgXY=
X-Gm-Gg: ASbGnct/yWLxYvlkTULcvgOvLRZS4i/h7TQv2BNElvzPnE0b1/Z1/EMcKXQaIm4zRQT
	ISkcGOQCgkgTJcQX6u5ppUxwG6Ze1K5X1tCLrnnHAg5df1LfPfAc+GHFImwsmaEba09HUa5rH+x
	51qM4O81FCCjNMGoUWo1VhqCseqEvyb3ExzEIdGrElUX6Luk6cq+741RtVlo0HnLcfSNF1ivHhF
	cbg7PPZ4lVEK4/yCt09Oqy7e9an1874Hk5REBq0JsCPk51iw45I51Ly14ko
X-Google-Smtp-Source: AGHT+IHELUnxP9ZvL+e2Ztemz39I9ORoPYZLTVwEa+XG73J5uz7w7yM0cuXu9KZqTaUsGk+1/+jmGA==
X-Received: by 2002:a05:6830:6610:b0:716:a95d:9ef with SMTP id 46e09a7af769-721e2e000d6mr4949630a34.2.1736437534534;
        Thu, 09 Jan 2025 07:45:34 -0800 (PST)
Received: from mail.minyard.net ([2001:470:b8f6:1b:9076:47eb:1e0a:16fb])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5f882625f0esm386258eaf.9.2025.01.09.07.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 07:45:34 -0800 (PST)
Date: Thu, 9 Jan 2025 09:45:27 -0600
From: Corey Minyard <corey@minyard.net>
To: Joel Granados <joel.granados@kernel.org>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Kees Cook <kees@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-crypto@vger.kernel.org,
	openipmi-developer@lists.sourceforge.net,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org, linux-hyperv@vger.kernel.org,
	linux-rdma@vger.kernel.org, linux-raid@vger.kernel.org,
	linux-scsi@vger.kernel.org, linux-serial@vger.kernel.org,
	xen-devel@lists.xenproject.org, linux-aio@kvack.org,
	linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
	codalist@coda.cs.cmu.edu, linux-mm@kvack.org,
	linux-nfs@vger.kernel.org, ocfs2-devel@lists.linux.dev,
	fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
	io-uring@vger.kernel.org, bpf@vger.kernel.org,
	kexec@lists.infradead.org, linux-trace-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, apparmor@lists.ubuntu.com,
	linux-security-module@vger.kernel.org, keyrings@vger.kernel.org
Subject: Re: [PATCH] treewide: const qualify ctl_tables where applicable
Message-ID: <Z3_vF3I453flXoZv@mail.minyard.net>
References: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-jag-ctl_table_const-v1-1-622aea7230cf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_074538_119929_3FC99769 
X-CRM114-Status: GOOD (  14.53  )
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
Reply-To: corey@minyard.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jan 09, 2025 at 02:16:39PM +0100, Joel Granados wrote:
> Add the const qualifier to all the ctl_tables in the tree except the
> ones in ./net dir. The "net" sysctl code is special as it modifies the
> arrays before passing it on to the registration function.
> 
...
> diff --git a/drivers/char/ipmi/ipmi_poweroff.c b/drivers/char/ipmi/ipmi_poweroff.c
> index 941d2dcc8c9d..de84f59468a9 100644
> --- a/drivers/char/ipmi/ipmi_poweroff.c
> +++ b/drivers/char/ipmi/ipmi_poweroff.c
> @@ -650,7 +650,7 @@ static struct ipmi_smi_watcher smi_watcher = {
>  #ifdef CONFIG_PROC_FS
>  #include <linux/sysctl.h>
>  
> -static struct ctl_table ipmi_table[] = {
> +static const struct ctl_table ipmi_table[] = {
>  	{ .procname	= "poweroff_powercycle",
>  	  .data		= &poweroff_powercycle,
>  	  .maxlen	= sizeof(poweroff_powercycle),

For the IPMI portion:

Acked-by: Corey Minyard <cminyard@mvista.com>


