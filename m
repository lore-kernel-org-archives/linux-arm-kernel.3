Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7A5D2ECF6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 23:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LSD4Ik8scI9yOd58Ngg5xIB2/+fX9P9jdMd8DczNzEE=; b=0xyeeuyUuRfEziSMwn82e2EVhI
	MQE3kQZx+ZQ3NEBdzORDSt5HbsACLzdpQZp7ur/Q5a0sN7GKOEoI2U6sNiNSCjbJ03mMaCKqlr8di
	PILP++LyZlC6/O1VTtb617NnrAUXLq5MosIKqm/cxTx2BKifupyoOwpJq+ABR7fk7YbZSCOMAijjp
	yYj/oOrwgTm9VWvRlnpoFike7yDdFDBfnfDgm0UasGyz9d05I77xNvINnsN+F6HCMgP5mnkeg5xuz
	ibhY5eJxs9QXUb92N1gld78RiOsk2sjLaWtLfgGcxCnmANYoKUtlB8uA4+G16EGVEGmZisW9S6d9J
	m9q4xZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhz0J-00000002yWk-1pG1;
	Mon, 19 Jan 2026 23:49:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhz0H-00000002yWV-1R0T;
	Mon, 19 Jan 2026 23:49:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 44DCF600CB;
	Mon, 19 Jan 2026 23:49:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5FF6C116C6;
	Mon, 19 Jan 2026 23:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1768866588;
	bh=dl4NfLFLRXwMEPRJZE/eVHiegg6qB2fc1iGd20FqEkA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=F1sdcYr41mj7u5GNBeON6roRdsjj9MA61KysbE5ZD0+DK7Gx8H4LEGBOPzjEDXih9
	 6zBnK2Zno4pcDfzPJ8jqL/kbTeXssZm3huJStpAl+ROSzJl3JMl0ZNBTBXmuAm9s6H
	 6JqxjQp+CLsr9IHQWqdk118THRMnnCRGDZfQLvvc=
Date: Mon, 19 Jan 2026 15:49:47 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Qiang Ma <maqianga@uniontech.com>
Cc: bhe@redhat.com, catalin.marinas@arm.com, will@kernel.org,
 kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] kexec: add kexec flag to control debug printing
Message-Id: <20260119154947.e351bfb8e97d91305932e2eb@linux-foundation.org>
In-Reply-To: <20251219093134.2268620-1-maqianga@uniontech.com>
References: <20251219093134.2268620-1-maqianga@uniontech.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Fri, 19 Dec 2025 17:31:30 +0800 Qiang Ma <maqianga@uniontech.com> wrote:

> The commit cbc2fe9d9cb2 ("kexec_file: add kexec_file flag to control
> debug printing") added the kexec_file flag to control debug printing.
> However, for arm64, after commit 6f8c1da071a4 ("kexec_file, arm64: print
> out debugging message if required"), when using the kexec_load interface,
> the kexec_image_info function is called to print debug message, but
> it uses kexec_dprintk, which is only available under kexec_file,
> then when specifying 'kexec -d', kexec_load interface will print nothing.
> 
> For riscv, commit eb7622d908a09 ("kexec_file, riscv: print out debugging
> message if required") remove kexec_image_info(), because the content has
> been printed out in generic code in kexec_file_load, but not in kexec_load.
> 
> Therefore, in order to solve the two problems mentioned above, for this
> patchset, several things need to be done:
> 
> 1. Enabling kexec_dprintk is available for kexec_load.
> 2. Add some debugging message of the deleted kexec_image_info
>    to generic code.
> 3. Remove duplicate debugging prints for arm64.

Some additional review input on this series would be good, if someone
has the time.


