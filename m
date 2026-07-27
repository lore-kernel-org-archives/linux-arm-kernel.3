Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE27C531C9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 23:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eHZ7WDv4z83QA/bqm4EIPds2VqkRB276KZK7CvOtJzQ=; b=ZipbLsw6Q13qJLeIsdBLB8zXDF
	tl93VMK/JzBvt4p0d99QfKSpsFD+BKuhrzB2Q0KzXQ20dR2gFDuGM5eUkrlWpOxbuKgIXQw2c/6KD
	Xx42M5aj+nC8HHJSP+jrnR2BP+n/vASkTfGUeXoU30V3SSfloeG8/SUWcTXTo7E+YC42uVf0bsy9x
	B2NIjEL088TCx8OBJdP9SID+AsgCGefgBe1D8MDpKCpRFOZMyzjT2I2zjGzUFuMpN320iVR1aWw+p
	8xvWIuZb1swhfOSA0W4K98lL2DSBvuvkxqB+hqfNmwR5sWMf90C7HRkFo8mpqFTZYqKk0HQOm/U3j
	0gvHY9RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woV2P-000000046R7-2lyS;
	Mon, 27 Jul 2026 23:47:13 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woV2O-000000046R0-172q
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 23:47:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6DCC4600FC;
	Mon, 27 Jul 2026 23:47:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0843B1F000E9;
	Mon, 27 Jul 2026 23:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785196031;
	bh=eHZ7WDv4z83QA/bqm4EIPds2VqkRB276KZK7CvOtJzQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=SAs/bWXkUVfiKiKtpDUwC9CcUSI/ho+9+mmVzzthlhfvV/r84NiP2KLQGr4ZH5Fdy
	 oFwnYIMqTKHql01T3Tnb9MBmxVFPF8nOxk7uVxhPmLpuz+opfgvXOlTy+I0K5zFq+W
	 LA8dgRi5XUllaPN1JH/+0eqE3EiN00WNxMiWIDrAiInQiBtQHdEIdf8xJVBB87XHo7
	 +V3HaOQMYrhvQx0AMDUKjmbiMCG+9vKvqbl8zEfMat8mbqG4HMLD3DAB0Urh3HAoT9
	 Qs+MC1AerKksZJKJWPra7JS4RrFYD2smZB2I79bnKjTduuOoQxKxZSvSKWzCvGpNQ6
	 y52Jsq08QJDyg==
Date: Tue, 28 Jul 2026 00:47:03 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 arm-scmi@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-doc@vger.kernel.org, sudeep.holla@kernel.org,
 james.quinlan@broadcom.com, f.fainelli@gmail.com,
 vincent.guittot@linaro.org, etienne.carriere@st.com, peng.fan@oss.nxp.com,
 michal.simek@amd.com, d-gole@ti.com, elif.topuz@arm.com,
 lukasz.luba@arm.com, philip.radford@arm.com, brauner@kernel.org,
 souvik.chakravarty@arm.com, david@kernel.org,
 subrahmanya.lingappa@oss.qualcomm.com, leitao@kernel.org, kas@kernel.org,
 puranjay@kernel.org, usama.arif@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v6 02/22] firmware: arm_scmi: Allow registration of
 unknown-size events/reports
Message-ID: <20260728004703.0696ca61@jic23-huawei>
In-Reply-To: <20260724144430.1440170-3-cristian.marussi@arm.com>
References: <20260724144430.1440170-1-cristian.marussi@arm.com>
	<20260724144430.1440170-3-cristian.marussi@arm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
MIME-Version: 1.0
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

On Fri, 24 Jul 2026 15:44:10 +0100
Cristian Marussi <cristian.marussi@arm.com> wrote:

> Allow protocols to register events with build-time unknown sizes: such
> events can be declared zero-sized and let the core SCMI stack perform the
> needed safe-net boundary checks based on the configured transport size.
> 
> Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>

