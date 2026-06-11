Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46392CD98CC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Jun 2026 13:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uSlBi62DRLhtbWpbozky+npCQI+7r3jm0jNsMTz2JG8=; b=XMEq5Ax341MuDEoW6ZzSRh4TJ2
	L2TduESXg4S+FAYV36TaeR1O4UA1wGok58hIn3j1ZKIe7iW1tbUe4mS5R1QpUc8s11U3paGgT77aZ
	qtZ+PXZn1HVaEaasNvwlQx3jT5ztdWDi6OhUQh/AcxG1qJEUZunKDrVOm0LlGJyVqEAiy4jr2d0rS
	WveYRzapiG1OVjMTBCV9P8pG6ZseYPYrKSVBn98SYHND/YtddEjsFpMd2SeB4kMPcIIYRoS6ilZAg
	aiMhEr4jEGLPjYefiqHv9qvKGdnAbxVGz8pb7cffkXG2p/sCrMjC6gfIQol0dqBbN6bfr5z/gQ3qe
	lTvnJt8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfj6-00000009Y9v-2PlC;
	Thu, 11 Jun 2026 13:45:44 +0000
Received: from fhigh-b2-smtp.messagingengine.com ([202.12.124.153])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXfj2-00000009Y9O-12Jp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Jun 2026 13:45:43 +0000
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 4FA3B7A00E0;
	Thu, 11 Jun 2026 09:45:39 -0400 (EDT)
Received: from phl-imap-05 ([10.202.2.95])
  by phl-compute-04.internal (MEProxy); Thu, 11 Jun 2026 09:45:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781185539;
	 x=1781271939; bh=uSlBi62DRLhtbWpbozky+npCQI+7r3jm0jNsMTz2JG8=; b=
	JSr4cfGmrHhJLg9IlliPuBxanoSFSCra6aV8fO9gfAG0wPJvqKq0Eez4NnaTWcf4
	d6jlzhj6afzvpEtWcljENgkXxGb6qW+7lS6jXm2xBWuCICNFiPRSopw2sGGt11Fk
	i37YzzTAroOnkQ3B8ZFydSjolyGyudwEh2e8op7Cc1a/oI+7M28OxhymwXxfQoMC
	QxkdKeuhEjMigtnA5hvkB2L03iP1RW02vyRwVmarP4BRt6ZdBRUfNKBOTgfeYmlr
	kaw62m5pkVTLDyE2BLYcx/MpxyeIqPziBiJXBjMquqL0i9Xzw9uxfR/ctGSVH1oZ
	vp9YTIKEvMsUP47QjbFkMQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781185539; x=
	1781271939; bh=uSlBi62DRLhtbWpbozky+npCQI+7r3jm0jNsMTz2JG8=; b=A
	0qy5V+XgxPigtlNruvE0nN/LNaqh8Ml6TFEdUtBFWXj/mVA4xbzf0TbsEc8xezog
	FyMFnJO6UGQo0usgM89K1L8N6cJm47PFP7tfwD4hcs63N0KdQap2rQNlG0ZcN45p
	J8qlfv1hWSahVGjI7Yg8zBuflPSVBK7YyfQU/Yoflq8A508Gs4zpkENGO+tKml/6
	Gv/ycxu88NA6mQ/1plOPNnUHYqtoih17KEiOvmx41wCUdq5XvMOU+YAccQRa4lKn
	Yalp1tG7Ds6KVDJTJIbYQh+5eODSEKWXhnFAruVqWHBvEyUJbDGac40sS6WfE60E
	SlvAEIfe2Nw9cu/8rYRgQ==
X-ME-Sender: <xms:AbwqavHd45SO2KLVjhT1kwMVfKTS-Q2i9vvscQocY1rEYKBu0fI67w>
    <xme:AbwqanLZJpKaGZhBcoUYDoQ4cKNv6UMof9YeYzSWWP4JPMk3MqXuOh-5zw8RwnAWu
    e-eeNXRzwOo4SYsruq8SdHEPbmvwp7mucINssJsYdk3CX0b2QkOs313>
X-ME-Proxy-Cause: dmFkZTGfu7NDfkRH3y24s4d4VazmqpPJmqhXz2XhxBopq5M4jlwRDwG6u8+9WGoh/C1xe7
    BRUDqVnAz7cWydFlYUlRI2kdc2SRaIo0UXOnlBHeAqS/hqqt7EfTUImmm/vAliqHRon2qQ
    Lo4+r+nvbe9tOvcnI0hW3ydk8ifRwxOiY794yrHBBMMjtkNnrGZk3fX5f2C1C32oXqRyWl
    3DWgFHrPV7DGtOB5Dvfqlxh+PQjskE+gOaSCPwwkrqjQgPpOYUZhQsh3s60WWFPdVm4kor
    P0TIf3mjkKysod9ng8Q6iwrRwq3EClxw+SZilzMcubnqBhcMFjTPN2KiyQ68qvvmfj6uAc
    xsB8m481785bALhzD9trhKNwgv2EN+WQkV0cs9InAi7Tze7WWRNFOH30yDT0OsrGoNVf7t
    51Ok7zPKMPb3+s69HC9XvqWGCJmTf3+pxl79HBKUZ1ubihZVBjoaJdsZsAGWV5SUlddtP0
    EuinbZXvMd9i4Et+cxM8m5TGZw506lWUmdLs27jXdMcqr3w2dF+k59g3bO2OjLXsAiosuo
    aVJZHQH04ZYox5o/id5g5oNe3fyD/apP8bONuAFS3Is+jJfyvLKzVMKS71OlpqU5ZFr1la
    WUi2fm8XMshwNIMkH7aRMoiZj3UD4vCL1DXhCHUvLLo2vhkvm9VKQ6THUpOA
X-ME-Proxy: <xmx:AbwqavSh1Rx3xpuHa0Gs2qCQuPxN1ZU1SZU12omKe7GRGpUBLvkB5A>
    <xmx:AbwqapuGYx8ztaQjfF9Q4JMHNCcae9Ko9xNbFqc3ML5zJLylHfQQgQ>
    <xmx:AbwqagbabJ8cJUOxCUZmCiTt_bNC112VUTPvEIons5IuTy5rkUoMSQ>
    <xmx:AbwqavF5M9a2CWHUkdQ84CUMlOokr3_PbyvKuDQAGfmPG_Elu8_AHQ>
    <xmx:A7wqak1o8jFkLwCjEGkW0AedBxh0bu6dbCgfg9Zlkr3Huu3Y5OiTUxh7>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id ED615182008A; Thu, 11 Jun 2026 09:45:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: AbO0-6eGr7Ag
Date: Thu, 11 Jun 2026 15:44:55 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "gordon.ge" <gordon.ge@bst.ai>, soc@lists.linux.dev
Cc: "yangzh0906@thundersoft.com" <yangzh0906@thundersoft.com>,
 linux-arm-kernel@lists.infradead.org, bst-upstream <bst-upstream@bstai.top>
Message-Id: <c7aa4a27-d523-4c83-8a5b-d2e7998d7e97@app.fastmail.com>
In-Reply-To: <20260611.111859-gordon.ge@bst.ai>
References: <20260611.111859-gordon.ge@bst.ai>
Subject: Re: [GIT PULL]arm64: BST C1200 eMMC DTS for v7.2
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260611_064540_344373_2D56F94C 
X-CRM114-Status: GOOD (  12.61  )
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

On Thu, Jun 11, 2026, at 05:21, gordon.ge@bst.ai wrote:
>
> Thank you for the review.
> I have fixed the two issues you mentioned and updated the pull request.

Hi Gordon,

unfortunately, I'm still seeing new problems here:

- you use a git@github.com url, which I can't pull from. Please
  add an 'insteadOf' rule to your .gitconfig that rewrites this
  to an https:// style address (or edit the text manually)

- https://patchwork.kernel.org/project/linux-soc/list/ does not
  actually show the contents of your pull requests. This is
  probably not caused by something you did, but it may be
  related to the URL problem.

- The commit you have contains

  Author: Gordon Ge <gordon.ge@bst.ai>
  Commit: Gordon Ge <gordon.ge@bst.ai>
  Signed-off-by: Albert Yang <yangzh0906@thundersoft.com>
  Acked-by: Gordon Ge <gordon.ge@bst.ai>

  which is not correct. If you commit the patch, your own
  Signed-off-by needs to be included, see
  https://www.kernel.org/pub/software/scm/git/docs/SubmittingPatches.html

  If Albert was the original author, you should also reflect
  that by using 'git commit --author="Albert Yang <yangzh0906@thundersoft.com>"'

Since we are getting very close to the merge window, I can't
guarantee that the patches make it in, but please resend
anyway. It may be easier to send these as individual
patches instead of pull requests, but that is up to you.

       Arnd

