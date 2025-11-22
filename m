Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190FBCFC521
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Nov 2025 10:11:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u2P7H6CSeWfeRavuvxhdKjLxwAh5A39cihk4/topHg8=; b=1sZmkyOKmBdUfU6V1XXMdzT60Q
	gtylixmeNaYo2LElj3fWOyHOHTr7AVM2+Yrnx8ZLMjm0Qo2wU2uDwVEP+/2kRdNgFZc7KHKbKuZt8
	tg5JrT+99XZv3vPkfjSUPLKYMrAeU5yICoEVrh7TyJYdTvs5qSG9uXkt28yZ0U+H6WVC/9jF5g/6J
	r003EqKbCzVo0EtcmnPkCEAW33vRwzD3OOJQDEkHZti5znf2voVE+xvwhXQU1uAmOT05uOjAmZ8/n
	poxgncgV1vzcHZtvM9p+B2bF7Yt2hD/bB4N7Vktt/R7sMSDP/MHmDjbi+QOf3TI0omgQAcK6Wu/YO
	LrVkG0uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMkau-00000009RzU-1nCr;
	Sat, 22 Nov 2025 10:11:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMkar-00000009Rz6-3atH
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Nov 2025 10:11:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 99AD243AB8;
	Sat, 22 Nov 2025 10:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F44DC4CEF5;
	Sat, 22 Nov 2025 10:11:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763806308;
	bh=gGkpOCI4RD9+V/lhr7rLU1PbrWKMwrcPaYukubgCn6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cGVd2iLjY3YbXoOgpZPWbV8VI/Q0gpuXxeTsEgUUkjE/QeE1BJB7SDo9Rxiwrpnos
	 M7Gvts5A037kLXQ0efZ5xXTxHdmHZy/sts2Az25ycq2NLydbTQJeSy2fm4kmowFeyw
	 3c6Puat0OSjYdVQzFal9hj0EYFIBZmKqUq5kSOzYyQ3z2uWKfz2Kr8/f/xTHGEBfiK
	 HiqlEN29dMRHCQ6LfACWIMph1Nvghv67Kub2SHo1tQaGsxILuc06Ui+neOSt8zBkrH
	 gkTKLcN/31/XdNURzpkpWZ6puS4EkMTkLF+nsqoMVDYO9fA5hrGhumrA+jPE8cvLfa
	 xG/mZdoSkZYFA==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Christophe Leroy <chleroy@kernel.org>,
	Gongwei Li <13875017792@163.com>
Cc: wangfushuai@baidu.com,
	frederic@kernel.org,
	ligongwei@kylinos.cn,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] soc/qman: use kmalloc_array() instead of kmalloc()
Date: Sat, 22 Nov 2025 11:11:31 +0100
Message-ID: <176380603653.1964777.3896069792665004828.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251121061022.114609-1-13875017792@163.com>
References: <20251121061022.114609-1-13875017792@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Developer-Signature: v=1; a=openpgp-sha256; l=403; i=chleroy@kernel.org; h=from:subject:message-id; bh=NgxY/adJ3cobR8fVnYzUybTqc0RHqQIANpRfoJAxGII=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWQq9oQ80vz5WzrrYw2D1brb7y6xHlT9ND/4j/k+/4feU w2+MpjFd5SyMIhxMciKKbIc/8+9a0bXl9T8qbv0YeawMoEMYeDiFICJGKxl+F/tnVWXe+Di3dsX fW2n/Z+UnqpeN/mZ5fdzvDM/C5ZtenqT4X/Z7cBntQuKzic/iNVSff/ik8599U7h4FkXKsUTehd 67OMEAA==
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251122_021149_936325_0EB7CC98 
X-CRM114-Status: UNSURE (   5.76  )
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


On Fri, 21 Nov 2025 14:10:22 +0800, Gongwei Li wrote:
> Replace kmalloc() with kmalloc_array() to prevent potential
> overflow, as recommended in Documentation/process/deprecated.rst.
> 
> 

Applied, thanks!

[1/1] soc/qman: use kmalloc_array() instead of kmalloc()
      commit: 4ee2a8883d9cd6370a2f858e886f16d7414c9c2f

Best regards,
-- 
Christophe Leroy (CS GROUP) <chleroy@kernel.org>

