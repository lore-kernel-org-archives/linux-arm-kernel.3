Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D919C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NCZgCLiWsoXFTz4ZMEeQaCxlFbMd7J/EL5cFZa5frmw=; b=JwqrET5x58jVQ7
	9+PZlwmzYa72XzOW7DG3eeu+BpBcn/6fUsFgKuiC2loUddmQeMwk/BiL/tXwHDGDd7qbpmHBXYi9x
	rQcKG2B4OJCHGx9pxi6wgetXsb/kDz1lSN7aw2cFmckWu6n2M8Xk0wC6yl6gaNmlRMGqSQ/iJ6DZC
	8nL3R6mYqlIUZVEgTIO31rhTV8cTfn2Z/kG1aK1Mz5WmNApQ7FicLfWGB2qxdRUgHmLzgVJgBF5Zg
	kYk+P4UB/GkYqG9Wpi6IHUvhUPX7aYbP9ZlIuJTFf+XQbLZhLunDzGg+0ZZvIzzNl0LpLEAgP3UOi
	8lxkbEz6c9u46/cK1d5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ66L-000000058rm-2FbP;
	Tue, 08 Jul 2025 11:03:05 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZ5l8-000000055Z9-2zmp;
	Tue, 08 Jul 2025 10:41:13 +0000
Received: from [192.168.0.172] (mob-5-90-136-241.net.vodafone.it [5.90.136.241])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 09D3350A;
	Tue,  8 Jul 2025 12:40:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751971238;
	bh=M/R7QNtY3WWeSOL+meIUvajO8tLpcXYlab4cNCnyGoM=;
	h=From:Subject:Date:To:Cc:From;
	b=IaqshucviT44STswB18ARkA4uVKslXHErGBrdTHWP31XFRilPI6iv0fRo66W8IRHq
	 QxqRHMJZi49FS8IMeWeKc29kZC/DEWjRlBlx0O2IsYBTOijudh/jlBByYaTdrni7oG
	 UOj0dnJ4+9oZZrfCVrwVttlPzKjOMvhppO40p4JY=
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Subject: [PATCH 0/8] media: Introduce V4L2 extensible parameters
Date: Tue, 08 Jul 2025 12:40:47 +0200
Message-Id: <20250708-extensible-parameters-validation-v1-0-9fc27c9c728c@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK/1bGgC/x2NwQqDMBAFf0X23IXEIpb+SulhjS/tgk1lN4gg/
 ntDj3OYmYMcpnC6dwcZNnX9lgbx0lF6S3mBdW5MfeiHMIbI2CuK67SAVzH5oMKcN1l0ltpkTrd
 rzGMeUgoTtcxqyLr/F4/nef4A/D07FnIAAAA=
X-Change-ID: 20250701-extensible-parameters-validation-c831f7f5cc0b
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Keke Li <keke.li@amlogic.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Dan Scally <dan.scally@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Jacopo Mondi <jacopo.mondi@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3686;
 i=jacopo.mondi@ideasonboard.com; h=from:subject:message-id;
 bh=M/R7QNtY3WWeSOL+meIUvajO8tLpcXYlab4cNCnyGoM=;
 b=owEBbQKS/ZANAwAKAXI0Bo8WoVY8AcsmYgBobPW/xcSH01XHbjzoLEDUF3UwH7xfSWv4wBikg
 ilaU3lDKZKJAjMEAAEKAB0WIQS1xD1IgJogio9YOMByNAaPFqFWPAUCaGz1vwAKCRByNAaPFqFW
 PHv/EACnTT5Kx+do5148Oe5MQo4vnrINzTcR/3VRciCYZTnkpWGV4i483Aphv+Kdg7E8VOVxpS0
 c8KvfVsnG7hN54xdkTAvP7ruWXYMNPh4Mv6fUlaVQRfC5aJZIHtlu1Fku72i5Mlo1c9g0PwvAsb
 tIWswq4JZe5idmb3M6fRKYxzYQ69CPAGkugPTH76QKi6FO0tGYQu9t1askHeoxwz+nMNnGOn/7F
 5t2z8sDOB9YMkMZtRxHu/QCkC+JO1hD3G9qEsXZFjy2i6wqdq8gGwe9yvI1n4LdDzXhyls446nu
 lFz4eTQe0tvZxzPCmpFT+vK7rOI5U+DFJug4mU6y+ddjUwf3tcQfCkdx3IzcXedQpLRdgJ6W/eT
 uphHlYimadaEbNexprf9Y671xatpQzSsLrM67gP7SP9TybJgm2prpkYbVk2uwjpYSIpulwn6j8a
 WWkQdm9a8Dyqh4KO5B+2Iw5aDLS2TVtG5j2m0T/Er32o7VIJtQR5EQKBVoFd/R4XVzXQ8X4IE2i
 nJrX6ixGSDNcRo7il5eKuK7KmPqrrSeilog040Nhe4OIzms6ZMlhaeioXkKX6ONpKAMzjUTaVT7
 CSheJI9Cp72swqX5GO9+lU8JJYpRSKaRUSJbCyDdNYm9ZZ5QZx5OgOPqALLOYR3+SRSjxoNr+iB
 uCEmsWq75n93tHA==
X-Developer-Key: i=jacopo.mondi@ideasonboard.com; a=openpgp;
 fpr=72392EDC88144A65C701EA9BA5826A2587AD026B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_034110_949571_58CDFC92 
X-CRM114-Status: GOOD (  12.59  )
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

Extensible parameters meta formats have been introduced in the Linux
kernel v6.12 initially to support different revision of the RkISP1 ISP
implemented in different SoC. In order to avoid breaking userspace
everytime an ISP configuration block is added or modified in the uAPI
these new formats, which are versionated and extensible by their
definition have been introduced.

See for reference:
e9d05e9d5db1 ("media: uapi: rkisp1-config: Add extensible params format")
6c53a7b68c5d ("media: rkisp1: Implement extensible params support")

The Amlogic C3 ISP driver followed shortly, introducing an extensible
format for the ISP configuration:

6d406187ebc0 ("media: uapi: Add stats info and parameters buffer for C3 ISP")

with a very similar, if not identical, implementation of the routines to
validate and handle the ISP configuration in the ISP driver in the
c3-isp-params.c file.

fb2e135208f3 ("media: platform: Add C3 ISP driver")

With the recent upstreaming attempt of the Mali C55 ISP driver from Dan,
a third user of extensible parameters is going to be itroduced in the
kernel, duplicating again in the driver the procedure for validating and
handling the ISP configuration blocks

https://patchwork.linuxtv.org/project/linux-media/patch/20250624-c55-v10-15-54f3d4196990@ideasonboard.com/

To avoid duplicating again the validation routines and common types
definition, this series introduces v4l2-params.c/.h for the kAPI
and v4l2-extensible-params.h for the uAPI and re-organize the RkISP1
and Amlogic C3 drivers to use the common types and the helper validation
routines.

If the here proposed approach is accepted, I propose to rebase the Mali
C55 driver on top of this series, to use the new common types and
helpers.

I have been able to test this on RkISP1 but not on C3.
Keke: would you be able to give this series a try and see what happens ?

Media CI pipeline:
https://gitlab.freedesktop.org/linux-media/users/jmondi/-/pipelines/1465950

Thanks
  j

Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
---
Jacopo Mondi (8):
      media: uapi: Introduce V4L2 extensible params
      media: uapi: Convert RkISP1 to V4L2 extensible params
      media: uapi: Convert Amlogic C3 to V4L2 extensible params
      media: Documentation: uapi: Add V4L2 extensible parameters
      media: v4l2-common: Introduce v4l2-params.c
      media: rkisp1: Use v4l2-params for validation
      media: amlogic-c3: Use v4l2-params for validation
      media: Documentation: kapi: Add v4l2 extensible parameters

 Documentation/driver-api/media/v4l2-core.rst       |   1 +
 Documentation/driver-api/media/v4l2-params.rst     |   5 +
 .../media/v4l/extensible-parameters.rst            |  89 +++++
 .../userspace-api/media/v4l/meta-formats.rst       |   1 +
 MAINTAINERS                                        |  10 +
 .../media/platform/amlogic/c3/isp/c3-isp-params.c  | 272 ++++++---------
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 364 +++++++++------------
 drivers/media/v4l2-core/Makefile                   |   3 +-
 drivers/media/v4l2-core/v4l2-params.c              | 106 ++++++
 include/media/v4l2-params.h                        | 166 ++++++++++
 include/uapi/linux/media/amlogic/c3-isp-config.h   |  45 +--
 include/uapi/linux/media/v4l2-extensible-params.h  | 106 ++++++
 include/uapi/linux/rkisp1-config.h                 |  60 +---
 13 files changed, 775 insertions(+), 453 deletions(-)
---
base-commit: a8598c7de1bcd94461ca54c972efa9b4ea501fb9
change-id: 20250701-extensible-parameters-validation-c831f7f5cc0b

Best regards,
-- 
Jacopo Mondi <jacopo.mondi@ideasonboard.com>


